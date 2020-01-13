(* ::Package:: *)

SetDirectory@NotebookDirectory[];


data = Import@"monte_carlo.wxf";
normalSix = HistogramDistribution[N@Normal@data["normal_six"], {1}];
normalDouble = HistogramDistribution[N@Normal@data["normal_double"], {1}];
normalFinish = HistogramDistribution[N@Normal@data["normal_finish"], {1}];
singleSix = HistogramDistribution[N@Normal@data["single_six"], {1}];
selectSix = HistogramDistribution[N@Normal@data["select_six"], {1}];
doubleSix = HistogramDistribution[N@Normal@data["double_six"], {1}];
doubleFinish = HistogramDistribution[N@Normal@data["double_finish"], {1}];


Export[
	"Distribution.mx",
	<|
		"NormalSix" -> normalSix,
		"NormalDouble" -> normalDouble,
		"NormalFinish" -> normalFinish,

		"SingleSix" -> singleSix,
		"SelectSix" -> selectSix,
		"DoubleSix" -> doubleSix,
		"DoubleFinish" -> doubleFinish
	|>
]
