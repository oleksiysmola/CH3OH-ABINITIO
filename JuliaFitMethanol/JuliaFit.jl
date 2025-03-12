using Printf
using LsqFit
using LinearAlgebra


hartreeToWavenumberConversion::Float64 = 219474.63
convertToRadians::Float64 = pi/180

# gridFilePath::String = "Grids/CBSgrid.txt"
include("CH3OH.jl")


# potentialInputFilePath::String = "inputCBS-C3V-Fit.inp"
potentialInputFilePath::String = "inputCBS-C3V-rCO-1D.inp"

keywords::Vector{String} = ["structural", "linear", "grid"]
inputBlocks::Vector{Vector{String}} = []
open(potentialInputFilePath, "r") do potentialInputFile::IOStream
    input::Vector{String} = readlines(potentialInputFile)
    addToBlock::Bool = false
    for keyword in keywords
        newBlock::Vector{String} = []
        for line in input
            if lowercase(line) == lowercase(keyword)
                addToBlock = true
            elseif lowercase(line) == "end"
                addToBlock = false
            end
            if addToBlock
                push!(newBlock, line)
            end
        end
        push!(inputBlocks, newBlock)
    end
end

structuralParameterBlock::Vector{String} = inputBlocks[1][2:end]
numberOfStructuralParameters::Int64 = size(structuralParameterBlock)[1] - 1
structuralParameterBlockSplit::Vector{Vector{SubString{String}}} = split.(structuralParameterBlock, r"\s+")
numberOfMorseParameters::Int64 = parse(Int64, structuralParameterBlockSplit[1][2])
numberOfModes::Int64 = size(structuralParameterBlockSplit[2])[1] - 3


structuralParameters::Vector{Float64} = zeros(numberOfStructuralParameters)
structuralParameterLabels::Vector{String} = []
structuralPowers::Matrix{Int64} = zeros(numberOfStructuralParameters, numberOfModes)
structuralParametersOn::Vector{Int64} = zeros(numberOfStructuralParameters)
for i in 1:numberOfStructuralParameters
    structuralParameters[i] = parse(Float64, structuralParameterBlockSplit[i + 1][end])
    push!(structuralParameterLabels, String(structuralParameterBlockSplit[i + 1][1]))
    structuralPowers[i, :] = parse.(Int64, structuralParameterBlockSplit[i + 1][2:end-2])
    structuralParametersOn[i] = parse(Float64, structuralParameterBlockSplit[i + 1][end - 1])
end

# How many MEP parameters for each stretch/bend - order of input file matters!
numberOfParametersRCO::Int64 = sum(occursin.(r"rCO", structuralParameterLabels))
numberOfParametersROH::Int64 = sum(occursin.(r"rOH", structuralParameterLabels))
numberOfParametersRCH::Int64 = sum(occursin.(r"rCH", structuralParameterLabels))
numberOfParametersAHOC::Int64 = sum(occursin.(r"aHOC", structuralParameterLabels))
numberOfParametersAHCO::Int64 = sum(occursin.(r"aHCO", structuralParameterLabels))

linearParameterBlock::Vector{String} = inputBlocks[2][2:end]
numberOfLinearParameters::Int64 = size(linearParameterBlock)[1]
linearParameterBlockSplit::Vector{Vector{SubString{String}}} = split.(linearParameterBlock, r"\s+")

linearParameters::Vector{Float64} = zeros(numberOfLinearParameters)
linearParameterLabels::Vector{String} = []
linearPowers::Matrix{Int64} = zeros(numberOfLinearParameters, numberOfModes)
linearParametersOn::Vector{Int64} = zeros(numberOfLinearParameters)

for i in 1:numberOfLinearParameters
    linearParameters[i] = parse(Float64, linearParameterBlockSplit[i][end])
    push!(linearParameterLabels, String(linearParameterBlockSplit[i][1]))
    linearPowers[i, :] = parse.(Int64, linearParameterBlockSplit[i][2:end-2])
    linearParametersOn[i] = parse(Float64, linearParameterBlockSplit[i][end - 1])
end

allParameters::Vector{Float64} = vcat(structuralParameters, linearParameters)
allParametersOn::Vector{Int64} = vcat(structuralParametersOn, linearParametersOn)

gridBlock::Vector{String} = inputBlocks[3][2:end]
numberOfGridPoints::Int64 = size(gridBlock)[1] 
gridBlockSplit::Vector{Vector{SubString{String}}} = split.(gridBlock, r"\s+")

grid::Matrix{Float64} = zeros(numberOfGridPoints, numberOfModes)
gridInternalCoordinates::Matrix{Float64} = zeros(numberOfGridPoints, numberOfModes)
energies::Vector{Float64} = zeros(numberOfGridPoints)

for i in 1:numberOfGridPoints
    grid[i, :]  = parse.(Float64, gridBlockSplit[i][1:numberOfModes])
    gridInternalCoordinates[i, :] = defineInternalCoordinates(grid[i, :])
    energies[i] = parse(Float64, gridBlockSplit[i][numberOfModes+1])
end


energies = energies.*hartreeToWavenumberConversion
minimumEnergy = minimum(energies)
println()
@printf("%12.10f \n", minimumEnergy)
energies = energies.-minimumEnergy

# Weight factor by Partridge and Schwenke
function computeWeightOfPoint(energy::Float64, energyThreshold=15000.0::Float64)::Float64
    weight::Float64 = (tanh(−0.0006*(energy - energyThreshold)) + 1.002002002)/2.002002002
    if energy > 10000.0
        weight = weight/(0.0001*energy)
    else
        weight = weight/(0.0001*10000.0)
    end
    return weight
end

weights::Vector{Float64} = computeWeightOfPoint.(energies)


# CH3OH
function potentialEnergy(internalCoordinates::Vector{Float64}, parameters::Vector{Float64})::Float64
    # Obtain MEP parameters for each stretch and bend
    parameterLowerRange::Int64 = 1
    parameterUpperRange::Int64 = numberOfParametersRCO
    # powersRCO::Matrix{Float64} = structuralPowers[1:parameterUpperRange, :]
    # parametersRCO::Vector{Float64} = parameters[1:parameterUpperRange]
    rCOeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[1:parameterUpperRange,:], parameters[1:parameterUpperRange])
    parameterUpperRange += numberOfParametersROH
    parameterLowerRange += numberOfParametersRCO
    # powersROH::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    # parametersROH::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    rOHeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersRCH
    parameterLowerRange += numberOfParametersROH
    # powersRCH::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    # parametersRCH::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    rCH1eq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    rCH2eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 2*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    rCH3eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 4*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersAHOC
    parameterLowerRange += numberOfParametersRCH
    # powersAHOC::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    # parametersAHOC::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    aHOCeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersAHCO
    parameterLowerRange += numberOfParametersAHOC
    # powersAHCO::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    # parametersAHCO::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    aHCO1eq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    aHCO2eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 2*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    aHCO3eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 4*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterLowerRange += numberOfParametersAHCO
    morseParameters::Vector{Float64} = parameters[parameterLowerRange:parameterLowerRange + numberOfMorseParameters - 1]

    # println(rCOeq)
    # println(rOHeq)
    # println(rCH1eq)
    # println(rCH2eq)
    # println(rCH3eq)
    # println(aHOCeq)
    # println(aHCO1eq)
    # println(aHCO2eq)
    # println(aHCO3eq)

    xi::Vector{Float64} = zeros(numberOfModes - 1)
    # Stretches
    xi[1] = 1 - exp(-morseParameters[1]*(internalCoordinates[1] - rCOeq))
    xi[2] = 1 - exp(-morseParameters[2]*(internalCoordinates[2] - rOHeq))
    xi[3] = 1 - exp(-morseParameters[3]*(internalCoordinates[3] - rCH1eq))
    xi[4] = 1 - exp(-morseParameters[3]*(internalCoordinates[4] - rCH2eq))
    xi[5] = 1 - exp(-morseParameters[3]*(internalCoordinates[5] - rCH3eq))

    # Bending
    xi[6] = (internalCoordinates[6] - aHOCeq)*convertToRadians
    xi[7] = (internalCoordinates[7] - aHCO1eq)*convertToRadians
    xi[8] = (internalCoordinates[8] - aHCO2eq)*convertToRadians
    xi[9] = (internalCoordinates[9] - aHCO3eq)*convertToRadians

    # Dihedrals
    xi[10] = internalCoordinates[10]
    xi[11] = internalCoordinates[11]
    
    parameterLowerRange += numberOfMorseParameters
    parameterUpperRange = size(parameters)[1]
    
    symmetryOperations::Array{Float64} = defineSymmetryOperations()
    numberOfSymmetryOperations::Int64 = size(symmetryOperations)[1]

    potential::Float64 = 0.0

    for i in 1:numberOfSymmetryOperations
        tau::Float64 = symmetryOperationsTau[i](internalCoordinates[12])
        xiTransformed::Vector{Float64} = symmetryOperations[i, :, :]*xi
        for j in parameterLowerRange:parameterUpperRange
            if linearPowers[j - parameterLowerRange + 1, end] >= 0
                potential += cos(linearPowers[j - parameterLowerRange + 1, end]*tau)*prod(xiTransformed.^linearPowers[j - parameterLowerRange + 1, 1:end-1])*parameters[j]
            else
                potential += sin(linearPowers[j - parameterLowerRange + 1, end]*tau)*prod(xiTransformed.^linearPowers[j - parameterLowerRange + 1, 1:end-1])*parameters[j]
            end
        end
    end
    potential /= 6
end

# Here we define a function which ensures parameters not currently in the fit are unchanged
function potentialEnergyFilterParams(gridInternalCoordinates::Matrix{Float64}, parameters::Vector{Float64})::Vector{Float64}
    parameters = [allParametersOn[i] == 1 ? parameters[i] : allParameters[i] for i in 1:length(allParametersOn)]
    numberOfPoints::Int64 = size(gridInternalCoordinates)[1]
    predictedEnergies::Vector{Float64} = zeros(numberOfPoints)
    for i in 1:numberOfPoints
        predictedEnergies[i] = potentialEnergy(gridInternalCoordinates[i, :], parameters)
    end
    return predictedEnergies 
end

function computeJacobian(gridInternalCoordinates::Matrix{Float64}, parameters::Vector{Float64})::Matrix{Float64}
    numberOfPoints::Int64 = size(gridInternalCoordinates)[1]
    numberOfParameters::Int64 = length(parameters)
    jacobian::Matrix{Float64} = zeros(numberOfPoints, numberOfParameters)
    
    # Obtain MEP parameters for each stretch and bend
    parameterLowerRange::Int64 = 1
    parameterUpperRange::Int64 = numberOfParametersRCO
    powersRCO::Matrix{Float64} = structuralPowers[1:parameterUpperRange, :]
    parametersRCO::Vector{Float64} = parameters[1:parameterUpperRange]
    rCOeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[1:parameterUpperRange,:], parameters[1:parameterUpperRange])
    parameterUpperRange += numberOfParametersROH
    parameterLowerRange += numberOfParametersRCO
    powersROH::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    parametersROH::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    rOHeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersRCH
    parameterLowerRange += numberOfParametersROH
    powersRCH::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    parametersRCH::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    rCH1eq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    rCH2eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 2*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    rCH3eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 4*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersAHOC
    parameterLowerRange += numberOfParametersRCH
    powersAHOC::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    parametersAHOC::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    aHOCeq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterUpperRange += numberOfParametersAHCO
    parameterLowerRange += numberOfParametersAHOC
    powersAHCO::Matrix{Float64} = structuralPowers[parameterLowerRange:parameterUpperRange,:]
    parametersAHCO::Vector{Float64} = parameters[parameterLowerRange:parameterUpperRange]
    aHCO1eq::Float64 = obtainCoordinateMEP(internalCoordinates[end], structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    aHCO2eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 2*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    aHCO3eq::Float64 = obtainCoordinateMEP(internalCoordinates[end] + 4*pi/3, structuralPowers[parameterLowerRange:parameterUpperRange,:], parameters[parameterLowerRange:parameterUpperRange])
    parameterLowerRange += numberOfParametersAHCO
    morseParameters::Vector{Float64} = parameters[parameterLowerRange:parameterLowerRange + numberOfMorseParameters - 1]

    # println(rCOeq)
    # println(rOHeq)
    # println(rCH1eq)
    # println(rCH2eq)
    # println(rCH3eq)
    # println(aHOCeq)
    # println(aHCO1eq)
    # println(aHCO2eq)
    # println(aHCO3eq)

    xi::Vector{Float64} = zeros(numberOfModes - 1)
    # Stretches
    xi[1] = 1 - exp(-morseParameters[1]*(internalCoordinates[1] - rCOeq))
    xi[2] = 1 - exp(-morseParameters[2]*(internalCoordinates[2] - rOHeq))
    xi[3] = 1 - exp(-morseParameters[3]*(internalCoordinates[3] - rCH1eq))
    xi[4] = 1 - exp(-morseParameters[3]*(internalCoordinates[4] - rCH2eq))
    xi[5] = 1 - exp(-morseParameters[3]*(internalCoordinates[5] - rCH3eq))

    # Bending
    xi[6] = (internalCoordinates[6] - aHOCeq)*convertToRadians
    xi[7] = (internalCoordinates[7] - aHCO1eq)*convertToRadians
    xi[8] = (internalCoordinates[8] - aHCO2eq)*convertToRadians
    xi[9] = (internalCoordinates[9] - aHCO3eq)*convertToRadians

    # Dihedrals
    xi[10] = internalCoordinates[10]
    xi[11] = internalCoordinates[11]
    
    parameterLowerRange += numberOfMorseParameters
    parameterUpperRange = size(parameters)[1]
    
    symmetryOperations::Array{Float64} = defineSymmetryOperations()
    numberOfSymmetryOperations::Int64 = size(symmetryOperations)[1]


    for i in 1:numberOfSymmetryOperations
        xiTransformed::Vector{Float64} = symmetryOperations[i, :, :]*xi
        tau::Float64 = symmetryOperationsTau[i](internalCoordinates[12])
        for j in parameterLowerRange:parameterUpperRange
            if linearPowers[j - parameterLowerRange + 1, end] >= 0
                potential += cos(linearPowers[j - parameterLowerRange + 1, end]*tau)*prod(xiTransformed.^linearPowers[j - parameterLowerRange + 1, 1:end-1])
            else
                potential += sin(linearPowers[j - parameterLowerRange + 1, end]*tau)*prod(xiTransformed.^linearPowers[j - parameterLowerRange + 1, 1:end-1])
            end
        end
    end
    potential /= 6
end

# fittedPotentialEnergy = curve_fit(potentialEnergyFilterParams, gridInternalCoordinates[1:19, :], energies[1:19], weights[1:19], allParameters)

# Fit type: LsqFit.LsqFitResult{Vector{Float64}, Vector{Float64}, Matrix{Float64}, Vector{Float64}, Vector{LsqFit.LMState{LsqFit.LevenbergMarquardt}}}

# urve_fit((xiPowers, expansionParameters) -> potentialEnergyModel(xiPowers, expansionParameters),
#     (xiPowers, expansionParameters) -> derivatives(xiPowers, expansionParameters),
#     xiPowers, energies, weights, expansionParameters)



