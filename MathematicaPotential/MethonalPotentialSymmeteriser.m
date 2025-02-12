Needs["Parallel`"]
nb = CreateNotebook[];
(* Symmetry Operations *)
numberOfSymmetryOperations = 6;
Subscript[S, E] := IdentityMatrix[11];
T[\[Alpha]_] := IdentityMatrix[2];
Subscript[S, 123] := {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -Sqrt[3]/2, -1/2}
};
Subscript[T, 123][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], -Sin[2*Pi*\[Alpha]/3]}, {Sin[2*Pi*\[Alpha]/3], Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 132] := {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, 0, 0, 0, Sqrt[3]/2, -1/2}
};
Subscript[T, 132][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], Sin[2*Pi*\[Alpha]/3]}, {-Sin[2*Pi*\[Alpha]/3], Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 12] := {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, 0, 0, 0, Sqrt[3]/2, 1/2}
};
Subscript[T, 12][\[Alpha]_] := {{Cos[2*Pi*\[Alpha]/3], -Sin[2*Pi*\[Alpha]/3]}, {-Sin[2*Pi*\[Alpha]/3], -Cos[2*Pi*\[Alpha]/3]}};
Subscript[S, 23] := {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1}
};
Subscript[T, 23][\[Alpha]_] := {{1, 0}, {0, -1}};
Subscript[S, 13] := {
{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2},
{0, 0, 0, 0, 0, 0, 0, 0, 0, -Sqrt[3]/2, 1/2}
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
maxMultiMode = 2;
numberOfRigidModes = 11;
(* 0th Order *)
zeroOrderCoefficients = ConstantArray[0, maxFourierMode + 1];
zeroOrderVariables = {};
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
	 labelCos = Subscript[f, "00000000000", \[Alpha]];
	 labelSin = Subscript[h, "00000000000", \[Alpha]];
	 zeroOrderCoefficients[[\[Alpha] + 1]] = {Subscript[f, "00000000000", \[Alpha]], Subscript[h, "00000000000", \[Alpha]]};
	 zeroOrderVariables = Append[zeroOrderVariables, Subscript[f, "00000000000", \[Alpha]]];
	 zeroOrderVariables = Append[zeroOrderVariables, Subscript[h, "00000000000", \[Alpha]]];
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
                  If[m < 10, 
                     multiModeVector[[m]] = 1, 
                     multiModeVector[[m]] = 2];, 
                  multiModeVector[[m]] = 0];
               powersString = powersString <> ToString[powers[[m]]];
	           ];
            multiMode = Total[multiModeVector[[1 ;; 9]]] + If[Total[multiModeVector[[10 ;; 11]]] > 0, 1, 0];
            If[multiMode <= maxMultiMode, 
               labelCos = Subscript[f, powersString, \[Alpha]];
	            labelSin = Subscript[h, powersString, \[Alpha]];
	            (* If[j == k, 
	               If[k == l,
                     thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]},
                     thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/2, Subscript[h, powersString, \[Alpha]]/2}];
	               If[j == l, 
                     thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/2, Subscript[h, powersString, \[Alpha]]/2},
                     If[k == l,
                        thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/2, Subscript[h, powersString, \[Alpha]]/2},
                        thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]]/2, Subscript[h, powersString, \[Alpha]]/6}];
                     ];
                  ] *)
                  thirdOrderCoefficients[[\[Alpha] + 1, j, k, l]] = {Subscript[f, powersString, \[Alpha]], Subscript[h, powersString, \[Alpha]]};
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
(* Print[MatrixForm[thirdOrderVariables]]
Print[MatrixForm[thirdOrderCoefficients]] *)
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
(* zeroOrderSolutions = ParallelTable[Solve[zeroOrderEquations[[i]], zeroOrderVariables], {i, 1, Length[zeroOrderEquations]}]; *)
(* zeroOrderSolutions = ParallelMap[
   Quiet @ Check[Solve[#[[1]], #[[2]]], $Failed] &,
   Transpose[{zeroOrderEquations, zeroOrderVariables}]
]; *)
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++, 
   For[i = 0, i <= Dimensions[zeroOrderVariables][[1]], i++,
      variable = zeroOrderVariables[[i]];
      If[variable == (variable /. zeroOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], " ", StringTake[variable[[2]], {9, 9}], " ", StringTake[variable[[2]], {10, 10}], " ", StringTake[variable[[2]], {11, 11}], "  ", variable[[3]] + fourierCycle*3
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
Dimensions[firstOrderEquations]
firstOrderEquations = Flatten[firstOrderEquations];
firstOrderEquations = Thread[firstOrderEquations == 0];
firstOrderSolutions = Solve[firstOrderEquations, firstOrderVariables];
(* firstOrderSolutions = ParallelTable[Solve[firstOrderEquations[[i]], firstOrderVariables], {i, 1, Length[firstOrderEquations]}]; *)
(* firstOrderSolutions = ParallelMap[Solve[#, firstOrderVariables] &, firstOrderEquations]; *)
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[firstOrderVariables][[1]], i++,
      variable = firstOrderVariables[[i]];
      If[variable == (variable /. firstOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], " ", StringTake[variable[[2]], {9, 9}], " ", StringTake[variable[[2]], {10, 10}], " ", StringTake[variable[[2]], {11, 11}], "  ", variable[[3]] + fourierCycle*3
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
secondOrderSolutions;
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[secondOrderVariables][[1]], i++,
      variable = secondOrderVariables[[i]];
      If[variable == (variable /. secondOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], " ", StringTake[variable[[2]], {9, 9}], " ", StringTake[variable[[2]], {10, 10}], " ", StringTake[variable[[2]], {11, 11}], "  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* 3rd Order *)
thirdOrderEquations = ConstantArray[0, {numberOfSymmetryOperations, maxFourierMode + 1, numberOfRigidModes, numberOfRigidModes, numberOfRigidModes}];
For[\[Alpha] = 0, \[Alpha] <= maxFourierMode, \[Alpha]++,
  torsionSymmetryOperations = {T[\[Alpha]], Subscript[T, 123][\[Alpha]], Subscript[T, 132][\[Alpha]], Subscript[T, 12][\[Alpha]], 
  Subscript[T, 23][\[Alpha]], Subscript[T, 13][\[Alpha]]};
  For[operationNumber = 1, operationNumber <= numberOfSymmetryOperations, operationNumber++,
      thirdOrderEquations[[operationNumber, \[Alpha] + 1]] = thirdOrderCoefficients[[\[Alpha] + 1]] - TensorContract[TensorProduct[symmetryOperations[[operationNumber]], symmetryOperations[[operationNumber]], symmetryOperations[[operationNumber]], Dot[thirdOrderCoefficients[[\[Alpha] + 1]], torsionSymmetryOperations[[operationNumber]]]], {{1, 7}, {3, 8}, {5, 9}}];
      ]
]
thirdOrderEquations = Flatten[thirdOrderEquations];
thirdOrderEquations = Thread[thirdOrderEquations == 0];
thirdOrderSolutions = Solve[thirdOrderEquations, thirdOrderVariables];
(* thirdOrderSolutions = ParallelTable[Solve[thirdOrderEquations[[i]], thirdOrderVariables], {i, 1, Length[thirdOrderEquations]}]; *)
(* thirdOrderSolutions = ParallelMap[Solve[#, thirdOrderVariables] &, thirdOrderEquations]; *)
thirdOrderSolutions
For[fourierCycle = 0, fourierCycle <= 7, fourierCycle++,
   For[i = 0, i <= Dimensions[thirdOrderVariables][[1]], i++,
      variable = thirdOrderVariables[[i]];
      If[variable == (variable /. thirdOrderSolutions)[[1]], 
         Print["* ", variable[[1]], "   ", StringTake[variable[[2]], {1, 1}], " ", StringTake[variable[[2]], {2, 2}], " ", StringTake[variable[[2]], {3, 3}], " ", StringTake[variable[[2]], {4, 4}], " ", StringTake[variable[[2]], {5, 5}], " ", StringTake[variable[[2]], {6, 6}], " ", StringTake[variable[[2]], {7, 7}], " ", StringTake[variable[[2]], {8, 8}], " ", StringTake[variable[[2]], {9, 9}], " ", StringTake[variable[[2]], {10, 10}], " ", StringTake[variable[[2]], {11, 11}], "  ", variable[[3]] + fourierCycle*3
         ];,
         variable
      ];
   ];
];
(* Print Solutions *)
expansionCoefficients = Flatten[Append[zeroOrderVariables, firstOrderVariables]];
MatrixForm[expansionCoefficients];
solutions = Flatten[Append[zeroOrderSolutions, firstOrderSolutions]];
Print[solutions]
NotebookWrite[nb, Cell["Hello", "Text"]];
NotebookWrite[nb, Cell[solutions, "Text"]];
NotebookSave[nb, "coefficients.nb"];
NotebookClose[nb];
Export["output.pdf", MatrixForm[symmetryOperations], "PDF"]
(* Check potential for invariance *)