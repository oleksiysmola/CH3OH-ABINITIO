numberOfSymmetricModes = 8;
maxFourierOrder = 2; (* Fourier order is cyclical so this covers all unique bases *)
maxOrder = 6;
maxMultiMode = 6; (* Maximal coupling between non-rigid modes *)

(* Define C3V symmetry operations *)
a = 1/2;
b = Sqrt[3]/2;
Subscript[S, E] := IdentityMatrix[8];
Subscript[S, 123] := {
    {0, 1, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 1, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2}, 
    {0, 0, 0, 0, 0, 0, -Sqrt[3]/2, -1/2}};
Subscript[S, 132] := {
    {0, 0, 1, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 1, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2}, 
    {0, 0, 0, 0, 0, 0, Sqrt[3]/2, -1/2}};
Subscript[S, 12] := {
    {0, 1, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 1, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 0, 0, 0, -1/2, Sqrt[3]/2},
    {0, 0, 0, 0, 0, 0, Sqrt[3]/2, 1/2}};
Subscript[S, 23] := {
    {1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 1, 0, 0, 0, 0, 0}, 
    {0, 1, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 1, 0}, 
    {0, 0, 0, 0, 0, 0, 0, -1}};
Subscript[S, 13] := {
    {0, 0, 1, 0, 0, 0, 0, 0}, 
    {0, 1, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, -1/2, -Sqrt[3]/2},
    {0, 0, 0, 0, 0, 0, -Sqrt[3]/2, 1/2}};
MatrixForm[Subscript[S, 123]];
MatrixForm[Subscript[S, 132]];
MatrixForm[Subscript[S, 12]]
MatrixForm[Subscript[S, 23]];
MatrixForm[Subscript[S, 13]];

symmetryOperations = {Subscript[S, E], Subscript[S, 123], 
   Subscript[S, 132], Subscript[S, 12], Subscript[S, 23], 
   Subscript[S, 13]};

(* Transformation rules for torsion *)
torsionSymmetryOperations[\[Tau]_] := {\[Tau], \[Tau] + 
    2*Pi/3, \[Tau] - 2*Pi/3, -\[Tau] - 2*Pi/3, -\[Tau], -\[Tau] + 
    2*Pi/3};

numberOfSymmetryOperations = Dimensions[symmetryOperations][[1]];

coordinates = {Subscript[\[Xi], 3], Subscript[\[Xi], 4], 
   Subscript[\[Xi], 5], Subscript[\[Xi], 7], Subscript[\[Xi], 8], 
   Subscript[\[Xi], 9], Subscript[\[Xi], 10], 
   Subscript[\[Xi], 11], \[Tau]};

MatrixForm[torsionSymmetryOperations[\[Tau]]];
MatrixForm[coordinates];


(* Here we initialise the coeficients *)
coefficients = {Subscript["f", Sequence @@ ConstantArray[0, numberOfSymmetricModes + 1]]}; 
MatrixForm[coefficients]
(* First Order *)
Print["Defining 1st order coefficients..."]
firstOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		powers[[i]] = powers[[i]] + 1;
		multiMode = Thread[powers[[1 ;; 6]] > 0];
		multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, True, False]], True];
		If[multiMode <= maxMultiMode, 
			firstOrderCoefficients[[\[Alpha] + 1]] = Append[firstOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
			firstOrderCoefficients[[\[Alpha] + 1]] = Append[firstOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		];
		powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	];
];
firstOrderCoefficients = DeleteDuplicates[firstOrderCoefficients];
(* Second Order *)
Print["Defining 2nd order coefficients..."]
secondOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		For[j = 1, j <= numberOfSymmetricModes, j++,
		    powers[[i]] = powers[[i]] + 1;
		    powers[[j]] = powers[[j]] + 1;
		    multiMode = Thread[powers[[1 ;; 6]] > 0];
		    multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, True, False]], True];
		    If[multiMode <= maxMultiMode, 
		    	secondOrderCoefficients[[\[Alpha] + 1]] = Append[secondOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
		    	secondOrderCoefficients[[\[Alpha] + 1]] = Append[secondOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		    ];
		    powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
		];
	];
];
secondOrderCoefficients = DeleteDuplicates[secondOrderCoefficients];
(* Third Order *)
Print["Defining 3rd order coefficients..."]
thirdOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		For[j = 1, j <= numberOfSymmetricModes, j++,
			For[k = 1, k <= numberOfSymmetricModes, k++,
		        powers[[i]] = powers[[i]] + 1;
		        powers[[j]] = powers[[j]] + 1;
		        powers[[k]] = powers[[k]] + 1;
		        multiMode = Thread[powers[[1 ;; 6]] > 0];
		        multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, {True}, {False}]], True];
		        If[multiMode <= maxMultiMode, 
		        	thirdOrderCoefficients[[\[Alpha] + 1]] = Append[thirdOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
		        	thirdOrderCoefficients[[\[Alpha] + 1]] = Append[thirdOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		        ];
		        powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
		    ];
		];
	];
];
thirdOrderCoefficients = DeleteDuplicates[thirdOrderCoefficients];
(* 4th Order *)
Print["Defining 4th order coefficients..."]
fourthOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		For[j = 1, j <= numberOfSymmetricModes, j++,
			For[k = 1, k <= numberOfSymmetricModes, k++,
				For[l = 1, l <= numberOfSymmetricModes, l++,
		            powers[[i]] = powers[[i]] + 1;
		            powers[[j]] = powers[[j]] + 1;
		            powers[[k]] = powers[[k]] + 1;
		            powers[[l]] = powers[[l]] + 1;
		            multiMode = Thread[powers[[1 ;; 6]] > 0];
		            multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, {True}, {False}]], True];
		            If[multiMode <= maxMultiMode, 
		            	fourthOrderCoefficients[[\[Alpha] + 1]] = Append[fourthOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
		            	fourthOrderCoefficients[[\[Alpha] + 1]] = Append[fourthOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		            ];
		            powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
		        ];
		    ];
		];
	];
];
fourthOrderCoefficients = DeleteDuplicates[fourthOrderCoefficients];
(* 5th Order *)
Print["Defining 5th order coefficients..."]
fifthOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		For[j = 1, j <= numberOfSymmetricModes, j++,
			For[k = 1, k <= numberOfSymmetricModes, k++,
				For[l = 1, l <= numberOfSymmetricModes, l++,
					For[m = 1, m <= numberOfSymmetricModes, m++,
		                powers[[i]] = powers[[i]] + 1;
		                powers[[j]] = powers[[j]] + 1;
		                powers[[k]] = powers[[k]] + 1;
		                powers[[l]] = powers[[l]] + 1;
		                powers[[m]] = powers[[m]] + 1;
		                multiMode = Thread[powers[[1 ;; 6]] > 0];
		                multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, {True}, {False}]], True];
		                If[multiMode <= maxMultiMode, 
		                	fifthOrderCoefficients[[\[Alpha] + 1]] = Append[fifthOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
		                	fifthOrderCoefficients[[\[Alpha] + 1]] = Append[fifthOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		                ];
		                powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
		            ];
		        ];
		    ];
		];
	];
];
fifthOrderCoefficients = DeleteDuplicates[fifthOrderCoefficients];
(* 6th Order *)
Print["Defining 6th order coefficients..."]
sixthOrderCoefficients = ConstantArray[{}, maxFourierOrder + 1];
For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
	powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
	For[i = 1, i <= numberOfSymmetricModes, i++,
		For[j = 1, j <= numberOfSymmetricModes, j++,
			For[k = 1, k <= numberOfSymmetricModes, k++,
				For[l = 1, l <= numberOfSymmetricModes, l++,
					For[m = 1, m <= numberOfSymmetricModes, m++,
						For[n = 1, n <= numberOfSymmetryModes, n++,
		                    powers[[i]] = powers[[i]] + 1;
		                    powers[[j]] = powers[[j]] + 1;
		                    powers[[k]] = powers[[k]] + 1;
		                    powers[[l]] = powers[[l]] + 1;
		                    powers[[m]] = powers[[m]] + 1;
		                    powers[[n]] = powers[[n]] + 1;
		                    multiMode = Thread[powers[[1 ;; 6]] > 0];
		                    multiMode = Count[Append[multiMode, If[Count[Thread[powers[[7 ;; 8]] > 0], True] > 0, {True}, {False}]], True];
		                    If[multiMode <= maxMultiMode, 
		                    	sixthOrderCoefficients[[\[Alpha] + 1]] = Append[sixthOrderCoefficients[[\[Alpha] + 1]], Subscript["f", Sequence @@ powers]];
		                    	sixthOrderCoefficients[[\[Alpha] + 1]] = Append[sixthOrderCoefficients[[\[Alpha] + 1]], Subscript["h", Sequence @@ powers]];
		                    ];
		                powers = Flatten[Append[ConstantArray[0, numberOfSymmetricModes], {\[Alpha]}]];
                        ];
                    ];
		        ];
		    ];
		];
	];
];
sixthOrderCoefficients = DeleteDuplicates[sixthOrderCoefficients];
coefficientsList = {firstOrderCoefficients, secondOrderCoefficients, thirdOrderCoefficients, fourthOrderCoefficients,
fifthOrderCoefficients, sixthOrderCoefficients};


(* Now we define the potential and collate a list of terms in the potential *)
Print["Building potentials..."]
(* numberOfCoefficients = Dimensions[coefficients][[1]]; *)
coefficients = Flatten[coefficientsList];
coefficients;
potential = ConstantArray[0, {numberOfSymmetryOperations, maxOrder, maxFourierOrder + 1}];
listOfTerms = ConstantArray[{}, {maxOrder, maxFourierOrder + 1}];
For[i = 1, i <= numberOfSymmetryOperations, i++,
	transformedCoordinates = symmetryOperations[[i, All]] . coordinates[[1 ;; numberOfSymmetricModes]];
	AppendTo[transformedCoordinates, torsionSymmetryOperations[coordinates[[numberOfSymmetricModes + 1]]][[i]]];
	For[j = 1, j <= maxOrder, j++,
		For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
			coefficientsAtCurrentOrder = coefficientsList[[j]][[\[Alpha] + 1]];
			numberOfCurrentCoefficients = Dimensions[coefficientsAtCurrentOrder][[1]];
			For[l = 1, l <= numberOfCurrentCoefficients, l++,
				coefficient = coefficientsAtCurrentOrder[[l]];
				fourierType = Level[coefficient, 1][[1]];
				powers = Level[coefficient, 1][[2 ;; numberOfSymmetricModes + 2]];
				newTerm = coefficient;
				For[k = 1, k <= numberOfSymmetricModes, k++,
					newTerm = newTerm*transformedCoordinates[[k]]^powers[[k]];
				];
				If[fourierType == "f", newTerm *= Cos[transformedCoordinates[[numberOfSymmetricModes + 1]]*powers[[numberOfSymmetricModes + 1]]]];
				If[fourierType == "h", newTerm *= Sin[transformedCoordinates[[numberOfSymmetricModes + 1]]*powers[[numberOfSymmetricModes + 1]]]];
				newTerm = newTerm // TrigExpand // TrigReduce; (* Break apart trig terms with trig addition - keep only sin(nt)/cos(nt) *)
				If[i == 1, listOfTerms[[j, \[Alpha] + 1]] = Append[listOfTerms[[j, \[Alpha] + 1]], newTerm/coefficient]];
				potential[[i, j, \[Alpha] + 1]] = potential[[i, j, \[Alpha] + 1]] + newTerm;
			];
			If[i == 1, 
			listOfTerms[[j, \[Alpha] + 1]] = DeleteDuplicates[listOfTerms[[j, \[Alpha] + 1]]];
			listOfTerms[[j, \[Alpha] + 1]] = DeleteCases[listOfTerms[[j, \[Alpha] + 1]], 0]];
		];
	];
];


(* Take differences in potential after symmetry operations applied *)
potentialDifference = ConstantArray[0, Dimensions[potential]];
For[i = 2, i <= numberOfSymmetryOperations, i++,
	potentialDifference[[i, All, All]] = potential[[i, All, All]] - potential[[1, All, All]] // Expand;
];


(* Define equations to solve *)
Print["Defining equations..."]
equations = ConstantArray[{}, Dimensions[potential]];
For[i = 1, i <= numberOfSymmetryOperations, i++,
	For[j = 1, j <= maxOrder, j++,
		For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
			numberOfTerms = Dimensions[listOfTerms[[j, \[Alpha] + 1]]][[1]];
			For[k = 1, k <= numberOfTerms, k++,
				equations[[i, j, \[Alpha] + 1]] = Append[equations[[i, j, \[Alpha] + 1]], Coefficient[potentialDifference[[i, j, \[Alpha] + 1]], listOfTerms[[j, \[Alpha] + 1]][[k]]] == 0];
			];
			equations[[i, j, \[Alpha] + 1]] = DeleteCases[equations[[i, j, \[Alpha] + 1]], True];
		];
	];
];

Print["Solving equations..."]
(* Solve equations *)
solutions = ConstantArray[{}, {maxOrder, maxFourierOrder + 1}];
For[i = 1, i <= maxOrder, i++,
	For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
		solutions[[i, \[Alpha] + 1]] = Solve[Flatten[equations[[All, i, \[Alpha] + 1]]], coefficientsList[[i, \[Alpha] + 1]]];
	];
];

(* solutions = Flatten[solutions]; *)
(* solutions *)

For[i = 1, i <= maxOrder, i++,
	For[\[Alpha] = 0, \[Alpha] <= maxFourierOrder, \[Alpha]++,
		numberOfCoefficientsAtCurrentOrder = Dimensions[coefficientsList[[i, \[Alpha] + 1]]][[1]];
		For[j = 0, j <= numberOfCoefficientsAtCurrentOrder, j++,
			If[(coefficientsList[[i, \[Alpha] + 1]][[j]] //. solutions[[i, \[Alpha] + 1]]) == coefficientsList[[i, \[Alpha] + 1]][[j]],
				Print[TableForm[Append[Level[coefficientsList[[i, \[Alpha] + 1]][[j]], 1], "grep"]]];
			];
		];
	];
];