(* ::Package:: *)

SetDirectory@NotebookDirectory[];


data = Import@"monte_carlo.wxf";
fit = EmpiricalDistribution[#]&;


Export[
	"Distribution.mx",
	<|
		"\:4e8c\:6c60\:51fa\:516d\:661f" -> fit@Normal@data["normal_six"],
		"\:4e8c\:6c60\:53cc\:516d\:661f" -> fit@Normal@data["normal_double"],
		"\:4e8c\:6c60\:53cc\:6ee1\:6f5c" -> fit@Normal@data["normal_finish"],

		"\:9650\:5b9a\:51fa\:516d\:661f" -> fit@Normal@data["single_six"],
		"\:9650\:5b9a\:6307\:5b9a\:516d\:661f" -> fit@Normal@data["select_six"],
		"\:9650\:5b9a\:53cc\:516d\:661f" -> fit@Normal@data["double_six"],
		"\:9650\:5b9a\:53cc\:6ee1\:6f5c" -> fit@Normal@data["double_finish"]
	|>
];


Export[
	"Count.mx",
	<|
		"\:4e8c\:6c60\:51fa\:516d\:661f" -> Sort@Tally@Normal@data["normal_six"],
		"\:4e8c\:6c60\:53cc\:516d\:661f" -> Sort@Tally@Normal@data["normal_double"],
		"\:4e8c\:6c60\:53cc\:6ee1\:6f5c" -> Sort@Tally@Normal@data["normal_finish"],

		"\:9650\:5b9a\:51fa\:516d\:661f" -> Sort@Tally@Normal@data["single_six"],
		"\:9650\:5b9a\:6307\:5b9a\:516d\:661f" -> Sort@Tally@Normal@data["select_six"],
		"\:9650\:5b9a\:53cc\:516d\:661f" -> Sort@Tally@Normal@data["double_six"],
		"\:9650\:5b9a\:53cc\:6ee1\:6f5c" -> Sort@Tally@Normal@data["double_finish"]
	|>
];
