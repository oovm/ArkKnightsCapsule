(* ::Package:: *)

SetDirectory@NotebookDirectory[];


data = Import["monte_carlo.json","RawJSON"];
fit[list_] := Block[
	{values, data},
	values = Rest@Replace[list, {x___, 0..} :> {x}];
	data = {Normalize[values, Total], Range@Length@values, False};
	DataDistribution["Empirical", data, 1, Total@values]
];


Export[
	"Distribution.mx",
	<|
		"\:4e8c\:6c60\:51fa\:516d\:661f" -> fit@Values@data["sp_single"],
		"\:4e8c\:6c60\:53cc\:516d\:661f" -> fit@Values@data["sp_double"],
		"\:4e8c\:6c60\:53cc\:6ee1\:6f5c" -> fit@Values@data["sp_finish"],

		"\:9650\:5b9a\:51fa\:516d\:661f" -> fit@Values@data["xd_single"],
		"\:9650\:5b9a\:6307\:5b9a\:516d\:661f" -> fit@Values@data["xd_select"],
		"\:9650\:5b9a\:53cc\:516d\:661f" -> fit@Values@data["xd_double"],
		"\:9650\:5b9a\:53cc\:6ee1\:6f5c" -> fit@Values@data["xd_finish"]
	|>
];


data=Import["Distribution.mx"];
