(* C3v(M) Symmetry Operations *)
numberOfSymmetryOperations = 6;
Subscript[S, E] := IdentityMatrix[8];
T[\[Alpha]_] := IdentityMatrix[2];
Subscript[S, 123] := {
{1, 0, 0, 0, 0, 0, 0, 0},
{0, -1/2, Sqrt[3]/2, 0, 0, 0, 0, 0},
{0, -Sqrt[3]/2, -1/2, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, -1/2, Sqrt[3]/2, 0, 0},
{0, 0, 0, 0, -Sqrt[3]/2, -1/2, 0, 0},
{0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, -Sqrt[3]/2, -1/2}
};
Subscript[T, 123][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], -Sin[2*Pi*\[Alpha]/3]}, {Sin[2*Pi*\[Alpha]/3], Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 132] := {
{1, 0, 0, 0, 0, 0, 0, 0},
{0, -1/2, -Sqrt[3]/2, 0, 0, 0, 0, 0},
{0, Sqrt[3]/2, -1/2, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, -1/2, -Sqrt[3]/2, 0, 0},
{0, 0, 0, 0, Sqrt[3]/2, -1/2, 0, 0},
{0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, Sqrt[3]/2, -1/2}
};
Subscript[T, 132][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], Sin[2*Pi*\[Alpha]/3]}, {-Sin[2*Pi*\[Alpha]/3], Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 12] := {
{1, 0, 0, 0, 0, 0, 0, 0},
{0, -1/2, Sqrt[3]/2, 0, 0, 0, 0, 0},
{0, Sqrt[3]/2, 1/2, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, -1/2, Sqrt[3]/2, 0, 0},
{0, 0, 0, 0, Sqrt[3]/2, 1/2, 0, 0},
{0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, Sqrt[3]/2, 1/2}
};
Subscript[T, 12][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], -Sin[2*Pi*\[Alpha]/3]}, {-Sin[2*Pi*\[Alpha]/3], -Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 23] := {
{1, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, -1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, -1, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, -1}
};
Subscript[T, 23][\[Alpha]_] := {{1, 0}, {0, -1}};
Subscript[S, 13] := {
{1, 0, 0, 0, 0, 0, 0, 0},
{0, -1/2, -Sqrt[3]/2, 0, 0, 0, 0, 0},
{0, -Sqrt[3]/2, 1/2, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, -1/2, -Sqrt[3]/2, 0, 0},
{0, 0, 0, 0, -Sqrt[3]/2, 1/2, 0, 0},
{0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, -Sqrt[3]/2, 1/2}
};
Subscript[T, 13][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], Sin[2*Pi*\[Alpha]/3]}, {Sin[2*Pi*\[Alpha]/3], -Cos[2*Pi*\[Alpha]/3]}};
MatrixForm[Subscript[S, 123]]; 
MatrixForm[Subscript[S, 132]];
MatrixForm[Subscript[S, 12]]
MatrixForm[Subscript[S, 23]]; 
MatrixForm[Subscript[S, 13]];
MatrixForm[Subscript[T, 123][1]]; 
MatrixForm[Subscript[T, 132][1]];
MatrixForm[Subscript[T, 12][1]] 
MatrixForm[Subscript[T, 23][1]]; 
MatrixForm[Subscript[T, 13][1]]; 
symmetryOperations = {Subscript[S, E], Subscript[S, 123], Subscript[S, 132], Subscript[S, 12], 
Subscript[S, 23], Subscript[S, 13]};
torsionSymmetryOperations = {T, Subscript[T, 123], Subscript[T, 132], Subscript[T, 12], 
Subscript[T, 23], Subscript[T, 13]};

(* Setup Coefficients *)
maxFourierMode = 2;
maxOrder = 6;
maxMultiMode = 3;
numberOfRigidModes = 8;
(* 0th Order *)
zeroOrderCoefficients = ConstantArray[0, maxFourierMode + 1];
zeroOrderVariables = {};
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
	 labelCos = Subscript[f, "00000000", \[Alpha]];
	 labelSin = Subscript[h, "00000000", \[Alpha]];
	 zeroOrderCoefficients[[\[Alpha] + 1]] = {Subscript[f, "00000000", \[Alpha]], Subscript[h, "00000000", \[Alpha]]};
	 zeroOrderVariables = Append[zeroOrderVariables, Subscript[f, "00000000", \[Alpha]]];
	 zeroOrderVariables = Append[zeroOrderVariables, Subscript[h, "00000000", \[Alpha]]];
]
MatrixForm[zeroOrderCoefficients];
MatrixForm[zeroOrderVariables];
(* 1st Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
firstOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes}];
firstOrderVariables = {};

For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     powers[[j]] = powers[[j]] + 1;
     powersString = "";
	 For[k = 1, k <= numberOfRigidModes, k++,
	    powersString = powersString <> ToString[powers[[k]]];
	    ]
	 labelCos = Subscript[f, powersString, \[Alpha]];
	 labelSin = Subscript[h, powersString, \[Alpha]];
	 firstOrderCoefficients[[\[Alpha] + 1, j]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]};
	 firstOrderVariables = Append[firstOrderVariables, Subscript[f, powersString, \[Alpha]]];
	 firstOrderVariables = Append[firstOrderVariables, Subscript[h, powersString, \[Alpha]]];
	 powers = ConstantArray[0, {numberOfRigidModes}];
     ]
]
MatrixForm[firstOrderCoefficients];
Dimensions[firstOrderCoefficients];
MatrixForm[firstOrderVariables];
MatrixForm[firstOrderCoefficients[[1]]];
Dimensions[firstOrderCoefficients[[1]]];
firstOrderVariables = DeleteDuplicates[firstOrderVariables];
(* 2nd Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
secondOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes}];
secondOrderVariables = {};

For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     For[k = 1, k <= numberOfRigidModes, k++,
        powers[[j]] = powers[[j]] + 1;
        powers[[k]] = powers[[k]] + 1;
        If[j == k, multiMode = 2, multiMode = 1];
        powersString = "";
        For[l = 1, l <= numberOfRigidModes, l++,
           powersString = powersString <> ToString[powers[[l]]];
	       ]
	    labelCos = Subscript[f, powersString, \[Alpha]];
	    labelSin = Subscript[h, powersString, \[Alpha]];
	    If[j == k, 
	       secondOrderCoefficients[[\[Alpha] + 1, j, k]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
	       secondOrderCoefficients[[\[Alpha] + 1, j, k]] = {Subscript[f, powersString, \[Alpha]]/2, Subscript[h, powersString, \[Alpha]]/2}];
	    secondOrderVariables = Append[secondOrderVariables, Subscript[f, powersString, \[Alpha]]];
	    secondOrderVariables = Append[secondOrderVariables, Subscript[h, powersString, \[Alpha]]];
	    powers = ConstantArray[0, {numberOfRigidModes}];
        ]
     ]
]
secondOrderVariables = DeleteDuplicates[secondOrderVariables];
MatrixForm[secondOrderCoefficients];
MatrixForm[secondOrderVariables];
(* 3rd Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
thirdOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
thirdOrderVariables = {};
multiModeVector = ConstantArray[0, {numberOfRigidModes}];
multiMode = 0;

For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     For[k = 1, k <= numberOfRigidModes, k++,
        For[l = 1, l <= numberOfRigidModes, l++,
            multiModeVector = ConstantArray[0, {numberOfRigidModes}];
            multiMode = 0;
            powers[[j]] = powers[[j]] + 1;
            powers[[k]] = powers[[k]] + 1;
            powers[[l]] = powers[[l]] + 1;
            powersString = "";
            For[m = 1, m <= numberOfRigidModes, m++,
               If[powers[[m]] > 0, 
                  If[m < numberOfRigidModes - 1, 
                     multiModeVector[[m]] = 1, 
                     multiModeVector[[m]] = 2];, 
                  multiModeVector[[m]] = 0];
               powersString = powersString <> ToString[powers[[m]]];
	           ];
            multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];
            If[multiMode <= maxMultiMode, 
               labelCos = Subscript[f, powersString, \[Alpha]];
	            labelSin = Subscript[h, powersString, \[Alpha]];
	            If[Count[powers, 3] == 1, 
                  thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
                  If[Count[powers, 2] == 1,
                     thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/3, Subscript[h, powersString, \[Alpha]]/3},
                     thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/6, Subscript[h, powersString, \[Alpha]]/6}
                     ];
                  ];
	               thirdOrderVariables = Append[thirdOrderVariables, Subscript[f, powersString, \[Alpha]]];
	               thirdOrderVariables = Append[thirdOrderVariables, Subscript[h, powersString, \[Alpha]]];, 
                  thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {0, 0}
                  ];
	         powers = ConstantArray[0, {numberOfRigidModes}];
            ];
        ];
     ];
];
thirdOrderVariables = DeleteDuplicates[thirdOrderVariables];
MatrixForm[thirdOrderCoefficients];
MatrixForm[thirdOrderVariables];
(* 4th Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
fourthOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
fourthOrderVariables = {};
multiModeVector = ConstantArray[0, {numberOfRigidModes}];
multiMode = 0;

For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     For[k = 1, k <= numberOfRigidModes, k++,
        For[l = 1, l <= numberOfRigidModes, l++,
            For[n = 1, n <= numberOfRigidModes, n++,
               multiModeVector = ConstantArray[0, {numberOfRigidModes}];
               multiMode = 0;
               powers[[j]] = powers[[j]] + 1;
               powers[[k]] = powers[[k]] + 1;
               powers[[l]] = powers[[l]] + 1;
               powers[[n]] = powers[[n]] + 1;
               powersString = "";
               For[m = 1, m <= numberOfRigidModes, m++,
                  If[powers[[m]] > 0, 
                     If[m < numberOfRigidModes - 1, 
                        multiModeVector[[m]] = 1, 
                        multiModeVector[[m]] = 2];, 
                     multiModeVector[[m]] = 0];
                  powersString = powersString <> ToString[powers[[m]]];
	              ];
               multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];
               If[multiMode <= maxMultiMode, 
                  labelCos = Subscript[f, powersString, \[Alpha]];
	               labelSin = Subscript[h, powersString, \[Alpha]];
	               If[Count[powers, 4] == 1, 
                     fourthOrderCoefficients[[\[Alpha] + 1, j, k, l, n]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
                     If[Count[powers, 3] == 1,
                        fourthOrderCoefficients[[\[Alpha] + 1, j, k, l, n]] = {Subscript[f, powersString, \[Alpha]]/4, Subscript[h, powersString, \[Alpha]]/4},
                        If[Count[powers, 2] == 2,
                           fourthOrderCoefficients[[\[Alpha] + 1, j, k, l, n]] = {Subscript[f, powersString, \[Alpha]]/6, Subscript[h, powersString, \[Alpha]]/6},
                           fourthOrderCoefficients[[\[Alpha] + 1, j, k, l, n]] = {Subscript[f, powersString, \[Alpha]]/24, Subscript[h, powersString, \[Alpha]]/24};
                           ]; 
                        ];
                     ];
	                  fourthOrderVariables = Append[fourthOrderVariables, Subscript[f, powersString, \[Alpha]]];
	                  fourthOrderVariables = Append[fourthOrderVariables, Subscript[h, powersString, \[Alpha]]];, 
                     fourthOrderCoefficients[[\[Alpha] + 1, j, k, l, n]] = {0, 0}
                     ];
	            powers = ConstantArray[0, {numberOfRigidModes}];
               ];
            ];
        ];
     ];
];
fourthOrderVariables = DeleteDuplicates[fourthOrderVariables];
MatrixForm[fourthOrderCoefficients];
MatrixForm[fourthOrderVariables];
(* 5th Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
fifthOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
fifthOrderVariables = {};
multiModeVector = ConstantArray[0, {numberOfRigidModes}];
multiMode = 0;

For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     For[k = 1, k <= numberOfRigidModes, k++,
        For[l = 1, l <= numberOfRigidModes, l++,
            For[n = 1, n <= numberOfRigidModes, n++,
               For[o = 1, o <= numberOfRigidModes, o++,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  multiMode = 0;
                  powers[[j]] = powers[[j]] + 1;
                  powers[[k]] = powers[[k]] + 1;
                  powers[[l]] = powers[[l]] + 1;
                  powers[[n]] = powers[[n]] + 1;
                  powers[[o]] = powers[[o]] + 1;
                  powersString = "";
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                        multiModeVector[[m]] = 0];
                     powersString = powersString <> ToString[powers[[m]]];
	                 ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];
                  If[multiMode <= maxMultiMode, 
                     labelCos = Subscript[f, powersString, \[Alpha]];
	                  labelSin = Subscript[h, powersString, \[Alpha]];
	                  If[Count[powers, 5] == 1, 
                        fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
                        If[Count[powers, 4] == 1,
                           fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {Subscript[f, powersString, \[Alpha]]/5, Subscript[h, powersString, \[Alpha]]/5},
                           If[Count[powers, 3] == 1,
                              fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {Subscript[f, powersString, \[Alpha]]/10, Subscript[h, powersString, \[Alpha]]/10},
                              If[Count[powers, 1] == 5, 
                                 fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {Subscript[f, powersString, \[Alpha]]/(5!), Subscript[h, powersString, \[Alpha]]/(5!)};,
                                 fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {0, 0};
                                 ]; 
                              ];
                           ];
                        ];
                        fifthOrderVariables = Append[fifthOrderVariables, Subscript[f, powersString, \[Alpha]]];
	                     fifthOrderVariables = Append[fifthOrderVariables, Subscript[h, powersString, \[Alpha]]];, 
                        fifthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o]] = {0, 0};
                  ];
                  powers = ConstantArray[0, {numberOfRigidModes}];
               ];
            ];
        ];
     ];
   ];
];
fifthOrderVariables = DeleteDuplicates[fifthOrderVariables];
MatrixForm[fifthOrderCoefficients];
MatrixForm[fifthOrderVariables];
(* 6th Order *)
powers = ConstantArray[0, {numberOfRigidModes}];
sixthOrderCoefficients = ConstantArray[0, {maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
sixthOrderVariables = {};
multiModeVector = ConstantArray[0, {numberOfRigidModes}];
multiMode = 0;
Print["Defining 6th order coefficients...."]
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  For[j = 1, j <= numberOfRigidModes, j++,
     For[k = 1, k <= numberOfRigidModes, k++,
        For[l = 1, l <= numberOfRigidModes, l++,
            For[n = 1, n <= numberOfRigidModes, n++,
               For[o = 1, o <= numberOfRigidModes, o++,
                  For[p = 1, p <= numberOfRigidModes, p++,
                     multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                     multiMode = 0;
                     powers[[j]] = powers[[j]] + 1;
                     powers[[k]] = powers[[k]] + 1;
                     powers[[l]] = powers[[l]] + 1;
                     powers[[n]] = powers[[n]] + 1;
                     powers[[o]] = powers[[o]] + 1;
                     powers[[p]] = powers[[p]] + 1;
                     powersString = "";
                     For[m = 1, m <= numberOfRigidModes, m++,
                        If[powers[[m]] > 0, 
                           If[m < numberOfRigidModes - 1, 
                              multiModeVector[[m]] = 1, 
                              multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
                        powersString = powersString <> ToString[powers[[m]]];
	                    ];
                     multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];
                     If[multiMode <= maxMultiMode, 
                        labelCos = Subscript[f, powersString, \[Alpha]];
	                     labelSin = Subscript[h, powersString, \[Alpha]];
	                     If[Count[powers, 6] == 1, 
                           sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
                           If[Count[powers, 5] == 1,
                              sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {Subscript[f, powersString, \[Alpha]]/6, Subscript[h, powersString, \[Alpha]]/6},
                              If[Count[powers, 4] == 1,
                                 sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {Subscript[f, powersString, \[Alpha]]/15, Subscript[h, powersString, \[Alpha]]/15},
                                 If[Count[powers, 3] == 2, 
                                    sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {Subscript[f, powersString, \[Alpha]]/20, Subscript[h, powersString, \[Alpha]]/20};,
                                    sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {Subscript[f, powersString, \[Alpha]]/(6!), Subscript[h, powersString, \[Alpha]]/(6!)};
                                    ]; 
                                 ];
                              ];
                           ];
                           sixthOrderVariables = Append[sixthOrderVariables, Subscript[f, powersString, \[Alpha]]];
	                        sixthOrderVariables = Append[sixthOrderVariables, Subscript[h, powersString, \[Alpha]]];, 
                           sixthOrderCoefficients[[\[Alpha] + 1, j, k, l, n, o, p]] = {0, 0};
                     ];
                     powers = ConstantArray[0, {numberOfRigidModes}];
                  ];
               ];
            ];
        ];
     ];
   ];
];
sixthOrderVariables = DeleteDuplicates[sixthOrderVariables];
MatrixForm[sixthOrderCoefficients];
MatrixForm[sixthOrderVariables];
(* Solve equations *)
(* 0th Order *)
zeroOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      zeroOrderEquations[[operationNumber, \[Alpha] + 1]] = zeroOrderCoefficients[[\[Alpha] + 1]] - Dot[zeroOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]];
      ]
]
zeroOrderEquations = Flatten[zeroOrderEquations];
zeroOrderEquations = Thread[zeroOrderEquations == 0];
zeroOrderSolutions = Solve[zeroOrderEquations, zeroOrderVariables];
zeroOrderSolutions
Print["Printing 0th order solutions..."]
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++, 
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], " 0 0 0  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* 1st Order *)
firstOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      firstOrderEquations[[operationNumber, \[Alpha] + 1]] = firstOrderCoefficients[[\[Alpha] + 1]] - Transpose[TensorContract[TensorProduct[Dot[firstOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]], symmetryOperations[[operationNumber]]], {1, 3}]];
      ]
]
Dimensions[firstOrderEquations];
firstOrderEquations = Flatten[firstOrderEquations];
firstOrderEquations = Thread[firstOrderEquations == 0];
firstOrderSolutions = Solve[firstOrderEquations, firstOrderVariables];
firstOrderSolutions
(* firstOrderSolutions = ParallelTable[Solve[firstOrderEquations[[i]], firstOrderVariables], {i, 1, Length[firstOrderEquations]}]; *)
(* firstOrderSolutions = ParallelMap[Solve[#, firstOrderVariables] &, firstOrderEquations]; *)
Print["Printing 1st order solutions..."]
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* 2nd Order *)
secondOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      secondOrderEquations[[operationNumber, \[Alpha] + 1]] = secondOrderCoefficients[[\[Alpha] + 1]] - TensorContract[TensorProduct[symmetryOperations[[operationNumber]], symmetryOperations[[operationNumber]], Dot[secondOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]]], {{1, 5}, {3, 6}}];
      ]
]
secondOrderEquations = Flatten[secondOrderEquations];
secondOrderEquations = Thread[secondOrderEquations == 0];
(* secondOrderSolutions = ParallelTable[Solve[secondOrderEquations[[i]], secondOrderVariables], {i, 1, Length[secondOrderEquations]}]; *)
secondOrderSolutions = Solve[secondOrderEquations, secondOrderVariables];
(* secondOrderSolutions = ParallelMap[Solve[#, secondOrderVariables] &, secondOrderEquations]; *)
secondOrderSolutions
Print["Printing 2rd order solutions..."]
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   2 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 2 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 2 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   1 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable
      ];
   ];
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* 3rd Order *)
Print["Applying symmetry operations to 3rd order coefficients..."]
thirdOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      transformedCoefficients = Dot[thirdOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 3}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 4}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 5}];
      thirdOrderEquations[[operationNumber, \[Alpha] + 1]] = thirdOrderCoefficients[[\[Alpha] + 1]] - transformedCoefficients;
      ]
]
Print["Done!"]
Print["Solving 3rd order equations..."]
thirdOrderEquations = Flatten[thirdOrderEquations];
thirdOrderEquations = Thread[thirdOrderEquations == 0];
thirdOrderSolutions = Solve[thirdOrderEquations, thirdOrderVariables];
Print["Done!"]
thirdOrderSolutions
Print["Printing 3rd order solutions..."]
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   3 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 3 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 3 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   2 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   2 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   1 2 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 2 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 2 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 2 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         If[maxMultiMode >= 3,
            Print["* ", variable[[1]], "   1 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         ],
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   2 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 2 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 2 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
         If[maxMultiMode >= 3,
            Print["* ", variable[[1]], "   1 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
            Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
            Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
            variable;
            ];,
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]],
         If[Count[Characters[variable[[2]]], "2"] == 1, 
            Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
            Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
            Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
            If[maxMultiMode >= 3, 
               Print["* ", variable[[1]], "   1 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
               Print["* ", variable[[1]], "   0 1 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];
               Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 1 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
               variable
               ];
            ];,
         variable
      ];
   ];
   For[i = 0, i <= Dimensions[thirdOrderVariables][[1]], i++,
      variable = thirdOrderVariables[[i]];
      If[variable == (variable /. thirdOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* 4th Order *)
Print["Applying symmetry operations to 4th order coefficients..."]
fourthOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      transformedCoefficients = Dot[fourthOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 3}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 4}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 5}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 6}];
      fourthOrderEquations[[operationNumber, \[Alpha] + 1]] = fourthOrderCoefficients[[\[Alpha] + 1]] - transformedCoefficients;
      ]
]
Print["Done!"]
Print["Solving 4th order equations..."]
fourthOrderEquations = Flatten[fourthOrderEquations];
fourthOrderEquations = Thread[fourthOrderEquations == 0];
fourthOrderSolutions = Solve[fourthOrderEquations, fourthOrderVariables];
Print["Done!"]
fourthOrderSolutions
Print["Printing 4th order solutions..."]
maxPower = 4;
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]],
         For[j = 0, j <= maxPower, j++,
            For[k = 0, k <= maxPower, k++,
               For[l = 0, l <= maxPower, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 1, j++,
            For[k = 0, k <= maxPower - 1, k++,
               For[l = 0, l <= maxPower - 1, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 1,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 2, j++,
            For[k = 0, k <= maxPower - 2, k++,
               For[l = 0, l <= maxPower - 2, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 2,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[thirdOrderVariables][[1]], i++,
      variable = thirdOrderVariables[[i]];
      If[variable == (variable /. thirdOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 3, j++,
            For[k = 0, k <= maxPower - 3, k++,
               For[l = 0, l <= maxPower - 3, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 3,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[fourthOrderVariables][[1]], i++,
      variable = fourthOrderVariables[[i]];
      If[variable == (variable /. fourthOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable;
      ];
   ];
];
(* 5th Order *)
Print["Applying symmetry operations to 5th order coefficients..."]
fifthOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      transformedCoefficients = Dot[fifthOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 3}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 4}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 5}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 6}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 7}];
      fifthOrderEquations[[operationNumber, \[Alpha] + 1]] = fifthOrderCoefficients[[\[Alpha] + 1]] - transformedCoefficients;
      ]
]
Print["Done!"]
Print["Solving 5th order equations..."]
fifthOrderEquations = Flatten[fifthOrderEquations];
fifthOrderEquations = Thread[fifthOrderEquations == 0];
fifthOrderSolutions = Solve[fifthOrderEquations, fifthOrderVariables];
Print["Done!"]
fifthOrderSolutions
Print["Printing 5th order solutions..."]
maxPower = 5;
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]],
         For[j = 0, j <= maxPower, j++,
            For[k = 0, k <= maxPower, k++,
               For[l = 0, l <= maxPower, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 1, j++,
            For[k = 0, k <= maxPower - 1, k++,
               For[l = 0, l <= maxPower - 1, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 1,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 2, j++,
            For[k = 0, k <= maxPower - 2, k++,
               For[l = 0, l <= maxPower - 2, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 2,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[thirdOrderVariables][[1]], i++,
      variable = thirdOrderVariables[[i]];
      If[variable == (variable /. thirdOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 3, j++,
            For[k = 0, k <= maxPower - 3, k++,
               For[l = 0, l <= maxPower - 3, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 3,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[fourthOrderVariables][[1]], i++,
      variable = fourthOrderVariables[[i]];
      If[variable == (variable /. fourthOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 4, j++,
            For[k = 0, k <= maxPower - 4, k++,
               For[l = 0, l <= maxPower - 4, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 4,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[fifthOrderVariables][[1]], i++,
      variable = fifthOrderVariables[[i]];
      If[variable == (variable /. fifthOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable;
      ];
   ];
];
(* 6th Order *)
Print["Applying symmetry operations to 6th order coefficients..."]
sixthOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      transformedCoefficients = Dot[sixthOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 3}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 4}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 5}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 6}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 7}];
      transformedCoefficients = TensorContract[TensorProduct[symmetryOperations[[operationNumber]], transformedCoefficients], {1, 8}];
      sixthOrderEquations[[operationNumber, \[Alpha] + 1]] = sixthOrderCoefficients[[\[Alpha] + 1]] - transformedCoefficients;
      ]
]
Print["Done!"]
Print["Solving 6th order equations..."]
sixthOrderEquations = Flatten[sixthOrderEquations];
sixthOrderEquations = Thread[sixthOrderEquations == 0];
sixthOrderSolutions = Solve[sixthOrderEquations, sixthOrderVariables];
Print["Done!"]
sixthOrderSolutions
Print["Printing 6th order solutions..."]
maxPower = 6;
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]],
         For[j = 0, j <= maxPower, j++,
            For[k = 0, k <= maxPower, k++,
               For[l = 0, l <= maxPower, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 1, j++,
            For[k = 0, k <= maxPower - 1, k++,
               For[l = 0, l <= maxPower - 1, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 1,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 2, j++,
            For[k = 0, k <= maxPower - 2, k++,
               For[l = 0, l <= maxPower - 2, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 2,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[thirdOrderVariables][[1]], i++,
      variable = thirdOrderVariables[[i]];
      If[variable == (variable /. thirdOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 3, j++,
            For[k = 0, k <= maxPower - 3, k++,
               For[l = 0, l <= maxPower - 3, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 3,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[fourthOrderVariables][[1]], i++,
      variable = fourthOrderVariables[[i]];
      If[variable == (variable /. fourthOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 4, j++,
            For[k = 0, k <= maxPower - 4, k++,
               For[l = 0, l <= maxPower - 4, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 4,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[fifthOrderVariables][[1]], i++,
      variable = fifthOrderVariables[[i]];
      If[variable == (variable /. fifthOrderSolutions)[[1]],
         For[j = 0, j <= maxPower - 5, j++,
            For[k = 0, k <= maxPower - 5, k++,
               For[l = 0, l <= maxPower - 5, l++,
               nonSymmetricPowers = {j, k, l};
               If[Total[nonSymmetricPowers] == maxPower - 5,
                  multiModeVector = ConstantArray[0, {numberOfRigidModes}];
                  powers = ToExpression[Characters[variable[[2]]]];
                  For[m = 1, m <= numberOfRigidModes, m++,
                     If[powers[[m]] > 0, 
                        If[m < numberOfRigidModes - 1, 
                           multiModeVector[[m]] = 1, 
                           multiModeVector[[m]] = 2];, 
                           multiModeVector[[m]] = 0];
   	              ];
                  multiMode = Total[multiModeVector[[1 ;; numberOfRigidModes - 2]]] + If[Total[multiModeVector[[numberOfRigidModes - 1 ;; numberOfRigidModes]]] > 0, 1, 0];  
                  multiMode = multiMode + If[j > 0, 1, 0] + If[k > 0, 1, 0] + If[l > 0, 1, 0];
                  If[multiMode <= maxMultiMode,
                      Print["* ", variable[[1]], "   ", j, " ", k, " ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", l, " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
                      variable;
                     ];      
                  ];
               ];
            ];
         ];
         variable;
      ];
   ];
   For[i = 0, i <= Dimensions[sixthOrderVariables][[1]], i++,
      variable = sixthOrderVariables[[i]];
      If[variable == (variable /. sixthOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   0 0 ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " 0 ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], "  ", variable[[3]] + fourierCycle*3];,
         variable;
      ];
   ];
];