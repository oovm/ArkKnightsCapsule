(* ::Package:: *)

SetDirectory@NotebookDirectory[];


data = Import@"monte_carlo.wxf";
fit = EmpiricalDistribution[#]&;
normalSix = fit@Normal@data["normal_six"];
normalDouble = fit@Normal@data["normal_double"];
normalFinish = fit@Normal@data["normal_finish"];
singleSix = fit@Normal@data["single_six"];
selectSix = fit@Normal@data["select_six"];
doubleSix = fit@Normal@data["double_six"];
doubleFinish = fit@Normal@data["double_finish"];


Export[
	"Distribution.mx",
	<|
		"\:4e8c\:6c60\:51fa\:516d\:661f" -> normalSix,
		"\:4e8c\:6c60\:53cc\:516d\:661f" -> normalDouble,
		"\:4e8c\:6c60\:53cc\:6ee1\:6f5c" -> normalFinish,

		"\:9650\:5b9a\:51fa\:516d\:661f" -> singleSix,
		"\:9650\:5b9a\:6307\:5b9a\:516d\:661f" -> selectSix,
		"\:9650\:5b9a\:53cc\:516d\:661f" -> doubleSix,
		"\:9650\:5b9a\:53cc\:6ee1\:6f5c" -> doubleFinish
	|>
]
