function defineSymmetryOperations(case="C3v(M)"::String)::Array{Float64}
    if case == "C3v(M)"
        symmetryOperations::Array{Float64} = zeros(Int64, 6, 11, 11)
        symmetryOperations[1, :, :] = Matrix(1I, 11, 11)
        # (132)
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
            0 0 0 0 0 0 0 0 0 -1/2 sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 -sqrt(3)/2 -1/2;            
            ]
        # (123)
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
            0 0 0 0 0 0 0 0 0 -1/2 -sqrt(3)/2;
            0 0 0 0 0 0 0 0 0 sqrt(3)/2 -1/2;
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

symmetryOperationsTau::Vector{Function} = [
    tau -> tau
    tau -> tau + 2*pi/3
    tau -> tau - 2*pi/3
    tau -> -tau - 2*pi/3
    tau -> -tau
    tau -> -tau + 2*pi/3
]

function defineInternalCoordinates(zMatrixCoordinates::Vector{Float64})::Vector{Float64}
    internalCoordinates::Vector{Float64} = zMatrixCoordinates
    convertToRadians::Float64 = pi/180

    # Convert bends to radians
    internalCoordinates[6] = internalCoordinates[6]*convertToRadians
    internalCoordinates[7] = internalCoordinates[7]*convertToRadians
    internalCoordinates[8] = internalCoordinates[8]*convertToRadians
    internalCoordinates[9] = internalCoordinates[9]*convertToRadians
    
    # Symmeterised dihedrals
    d23::Float64 = zMatrixCoordinates[12] - zMatrixCoordinates[11]
    d12::Float64 = zMatrixCoordinates[11] - zMatrixCoordinates[10]
    d13::Float64 = zMatrixCoordinates[10] - zMatrixCoordinates[12] + 360.0
    internalCoordinates[10] = (2*d23 - d12 - d13)*convertToRadians/sqrt(6)
    internalCoordinates[11] = (d12 - d13)*convertToRadians/sqrt(2)
    # Torsion
    internalCoordinates[12] = (zMatrixCoordinates[10] + zMatrixCoordinates[11] + zMatrixCoordinates[12])*convertToRadians/3
    return internalCoordinates
end


function obtainCoordinateMEP(tau::Float64, powersMEP::Matrix{Int64}, parametersMEP::Vector{Float64})::Float64
    numberOfParametersMEP::Int64 = size(parametersMEP)[1]
    coordinateMEP::Float64 = 0
    for i in 1:numberOfParametersMEP
        if powersMEP[i, 12] >= 0
            coordinateMEP += parametersMEP[i]*cos(powersMEP[i, 12]*tau)
        else
            coordinateMEP += parametersMEP[i]*sin(-powersMEP[i, 12]*tau)
        end
    end
    return coordinateMEP
end