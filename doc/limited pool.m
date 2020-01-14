(* ::Package:: *)

SetDirectory@NotebookDirectory[];


(* ::Text:: *)
(*url = "https://github.com/GalAster/ArkKnightsCapsule/releases/download/v1.4.0/Distribution.mx";*)
(*Dataset[data = N /@ Import[url]]*)


(* ::Section:: *)
(*F*)


formatNumber[num_, d_Integer : 3] := Block[
	{s = StringSplit[ToString@Round[num, 10.0^-d], "."], i, f},
	i = First@s;
	If[Length@s == 1, f = "000", f = Last@s];
	f = StringPadRight[f, d, "0"];
	StringJoin[{i, ".", f}]
]


(* ::Section:: *)
(*F*)


plot[names_, r_] := DiscretePlot[
	Evaluate[PDF[data[#], x] & /@ names], {x, 0, r},
	PlotRange -> {{0, r}, {0, All}}, AspectRatio -> 1 / 4, PlotTheme -> {"Business"},
	PlotLegends -> Placed[names, Above], ImageSize -> 800, Joined -> True, AxesOrigin -> {0, 0}
];
grand[names_, r_] := DiscretePlot[
	Evaluate[CDF[data[#], x] & /@ names], {x, 0, r},
	PlotRange -> {{0, r}, {0, 1}}, AspectRatio -> 1, PlotTheme -> {"Business", "FullAxesGrid"},
	PlotLegends -> names, ImageSize -> 600, Joined -> True, AxesOrigin -> {0, 0}
];


pdf = plot[{"\:9650\:5b9a\:51fa\:516d\:661f", "\:4e8c\:6c60\:51fa\:516d\:661f", "\:9650\:5b9a\:6307\:5b9a\:516d\:661f"}, 100]
cdf = grand[{"\:9650\:5b9a\:51fa\:516d\:661f", "\:4e8c\:6c60\:51fa\:516d\:661f", "\:9650\:5b9a\:6307\:5b9a\:516d\:661f"}, 200]
Export["limited_pool/single_six_pdf.png", pdf, Background -> None];
Export["limited_pool/single_six_cdf.png", cdf, Background -> None];


pdf = plot[{"\:4e8c\:6c60\:53cc\:516d\:661f", "\:9650\:5b9a\:53cc\:516d\:661f"}, 300]
cdf = grand[{"\:4e8c\:6c60\:53cc\:516d\:661f", "\:9650\:5b9a\:53cc\:516d\:661f"}, 400]
Export["limited_pool/double_six_pdf.png", pdf, Background -> None];
Export["limited_pool/double_six_cdf.png", cdf, Background -> None];


pdf = plot[{"\:4e8c\:6c60\:53cc\:6ee1\:6f5c", "\:9650\:5b9a\:53cc\:6ee1\:6f5c"}, 1200]
cdf = grand[{"\:4e8c\:6c60\:53cc\:6ee1\:6f5c", "\:9650\:5b9a\:53cc\:6ee1\:6f5c"}, 1600]
Export["limited_pool/finish_six_pdf.png", pdf, Background -> None];
Export["limited_pool/finish_six_cdf.png", cdf, Background -> None];


(* ::Section:: *)
(*F*)


lucky[key_] := {
	key,
	formatNumber[Mean@data[key], 2],
	Round@Quantile[data[key], 1 / 2],
	formatNumber[StandardDeviation@data[key], 2],
	Round@Quantile[data[key], 5 / 100],
	Round@Quantile[data[key], 25 / 100],
	Round@Quantile[data[key], 75 / 100],
	Round@Quantile[data[key], 90 / 100],
	Round@Quantile[data[key], 99 / 100]
}


StringJoin[{
	"|\:4e8b\:4ef6|\:671f\:671b|\:4e2d\:4f4d\:6570|\:6807\:51c6\:5dee|\:6b27\:7687|\:6b27\:6d32\:4eba|\:975e\:6d32\:4eba|\:975e\:914b|\:88ab\:9057\:5fd8\:8005|\n",
	"|:-|-:|-:|-:|-:|-:|-:|-:|-:|\n",
	StringRiffle[lucky /@ Keys@data, "\n", "|"]
}]


v = Join[Range[1, 20], 10 * Range[3, 9], 100 * Range[1, 20]];
try[key_] := Table[formatNumber[100Probability[x <= i, x\[Distributed]data[key]], 2] <> "%", {i, v}]


StringJoin[{
	StringRiffle[Prepend[Keys@data, "\:6b21\:6570"], "|"] <> "\n",
	"|-:|-:|-:|-:|-:|-:|-:|-:|\n",
	StringRiffle[Transpose@Prepend[try /@ Keys@data, v], "\n", "|"]
}]


v = Join[Range[1, 50], 10 * Range[6, 9], 100 * Range[1, 19], 1000 * Range[2, 10]];
try[key_] := Table[formatNumber[100Probability[x <= i, x\[Distributed]data[key]]] <> "%", {i, v}]


StringJoin[{
	StringRiffle[Prepend[Keys@data, "\:6b21\:6570"], "|"] <> "\n",
	"|-:|-:|-:|-:|-:|-:|-:|-:|\n",
	StringRiffle[Transpose@Prepend[try /@ Keys@data, v], "\n", "|"]
}]
