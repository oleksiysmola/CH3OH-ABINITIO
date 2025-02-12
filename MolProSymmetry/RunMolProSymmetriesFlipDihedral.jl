using LinearAlgebra
grid::Vector{Float64} = [1.0, 0.9, 1.2, 1.0, 1.1, 100.00, 110.00, 112.00, 108.00, 1.2, 2.4, 40.00] 

function defineSymmetryOperations(case="C3v(M)"::String)::Array{Float64}
    if case == "C3v(M)"
        symmetryOperations::Array{Float64} = zeros(Int64, 6, 11, 11)
        symmetryOperations[1, :, :] = Matrix(1I, 11, 11)
        # (123)
        symmetryOperations[2, :, :] = [
            1 0 0 0 0 0 0 0 0 0 0;
            0 1 0 0 0 0 0 0 0 0 0;
            0 0 0 1 0 0 0 0 0 0 0; 
            0 0 0 0 1 0 0 0 0 0 0; 
            0 0 1 0 0 0 0 0 0 0 0;
            0 0 0 0 0 1 0 0 0 0 0;
            0 0 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 0 0 1 0 0;
            0 0 0 0 0 0 1 0 0 0 0;
            0 0 0 0 0 0 0 0 0 -1/2 -sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 sqrt(3)/2 -1/2;            
            ]
        # (132)
        symmetryOperations[3, :, :] = [
            1 0 0 0 0 0 0 0 0 0 0;
            0 1 0 0 0 0 0 0 0 0 0;
            0 0 0 0 1 0 0 0 0 0 0;
            0 0 1 0 0 0 0 0 0 0 0;
            0 0 0 1 0 0 0 0 0 0 0;
            0 0 0 0 0 1 0 0 0 0 0;
            0 0 0 0 0 0 0 0 1 0 0;
            0 0 0 0 0 0 1 0 0 0 0;
            0 0 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 0 0 0 -1/2 sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 -sqrt(3)/2 -1/2;
        ]
        # (12)*
        symmetryOperations[4, :, :] = [
            1 0 0 0 0 0 0 0 0 0 0;
            0 1 0 0 0 0 0 0 0 0 0;
            0 0 0 1 0 0 0 0 0 0 0;
            0 0 1 0 0 0 0 0 0 0 0;
            0 0 0 0 1 0 0 0 0 0 0;
            0 0 0 0 0 1 0 0 0 0 0;
            0 0 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 1 0 0 0 0;
            0 0 0 0 0 0 0 0 1 0 0;
            0 0 0 0 0 0 0 0 0 -1/2 sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 sqrt(3)/2 1/2;
        ]
        # (23)*
        symmetryOperations[5, :, :] = [
            1 0 0 0 0 0 0 0 0 0 0;
            0 1 0 0 0 0 0 0 0 0 0;    
            0 0 1 0 0 0 0 0 0 0 0;
            0 0 0 0 1 0 0 0 0 0 0;
            0 0 0 1 0 0 0 0 0 0 0;
            0 0 0 0 0 1 0 0 0 0 0;
            0 0 0 0 0 0 1 0 0 0 0;
            0 0 0 0 0 0 0 0 1 0 0;
            0 0 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 0 0 0 1 0;
            0 0 0 0 0 0 0 0 0 0 -1;
        ]
        # (13)*
        symmetryOperations[6, :, :] = [
            1 0 0 0 0 0 0 0 0 0 0;
            0 1 0 0 0 0 0 0 0 0 0;    
            0 0 0 0 1 0 0 0 0 0 0;
            0 0 0 1 0 0 0 0 0 0 0;
            0 0 1 0 0 0 0 0 0 0 0;
            0 0 0 0 0 1 0 0 0 0 0;
            0 0 0 0 0 0 0 0 1 0 0;
            0 0 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 1 0 0 0 0;
            0 0 0 0 0 0 0 0 0 -1/2 -sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 -sqrt(3)/2 1/2;
        ]
    end
    return symmetryOperations
end

function applySymmetryOperations(symmetryOperations::Array{Float64}, grid::Vector{Float64})::Array{Float64}
    convertToDegrees::Float64 = 180.0/pi
    grids::Array{Float64} = zeros(6, 12)
    for i in 1:6
        grids[i, 1:end-1] = symmetryOperations[i, :, :]*grid[1:end-1]
    end
    grids[2, 12] = grids[2, 12] + 2*pi*convertToDegrees/3
    grids[3, 12] = grids[3, 12] - 2*pi*convertToDegrees/3
    grids[4, 12] = -grids[4, 12] - 2*pi*convertToDegrees/3
    grids[5, 12] = -grids[5, 12]
    grids[6, 12] = -grids[6, 12] + 2*pi*convertToDegrees/3
    return grids
end

symmetryOperations = defineSymmetryOperations()
grids = applySymmetryOperations(symmetryOperations, grid)

for i in 2:3
    molproGrid::Vector{Float64} = zeros(12)
    molproGrid[1:9] = grids[i, 1:9]
    molproGrid[10] = grids[i, 12]+1.0/3.0*sqrt(2.0)*grids[i, 11]
    molproGrid[11] = 120.0+grids[i, 12]-1.0/6.0*sqrt(2.0)*grids[i, 11]-1.0/6.0*sqrt(6.0)*grids[i, 10]
    molproGrid[12] = 240.0+grids[i, 12]-1.0/6.0*sqrt(2.0)*grids[i, 11]+1.0/6.0*sqrt(6.0)*grids[i, 10]
    run(`./RunMolPro.csh $(i) $(molproGrid[1]) $(molproGrid[2]) $(molproGrid[3]) $(molproGrid[4]) $(molproGrid[5]) $(molproGrid[6]) $(molproGrid[7]) $(molproGrid[8]) $(molproGrid[9]) $(molproGrid[10]) $(molproGrid[11]) $(molproGrid[12])`) 
end