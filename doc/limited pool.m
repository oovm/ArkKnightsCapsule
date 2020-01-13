(* ::Package:: *)

SetDirectory@NotebookDirectory[];


url = "https://github.com/GalAster/ArkKnightsCapsule/releases/download/v1.2.0/Distribution.mx";
Dataset[data = N /@ Import[url]]


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


(* ::Section:: *)
(*F*)


pdf = plot[{"\:9650\:5b9a\:51fa\:516d\:661f", "\:4e8c\:6c60\:51fa\:516d\:661f", "\:9650\:5b9a\:6307\:5b9a\:516d\:661f"}, 100]
cdf = grand[{"\:9650\:5b9a\:51fa\:516d\:661f", "\:4e8c\:6c60\:51fa\:516d\:661f", "\:9650\:5b9a\:6307\:5b9a\:516d\:661f"}, 200]
Export["limited pool/single_six_pdf.png", pdf, Background -> None];
Export["limited pool/single_six_cdf.png", cdf, Background -> None];


pdf = plot[{"\:4e8c\:6c60\:53cc\:516d\:661f", "\:9650\:5b9a\:53cc\:516d\:661f"}, 300]
cdf = grand[{"\:4e8c\:6c60\:53cc\:516d\:661f", "\:9650\:5b9a\:53cc\:516d\:661f"}, 400]
Export["limited pool/double_six_pdf.png", pdf, Background -> None];
Export["limited pool/double_six_cdf.png", cdf, Background -> None];


cdf = plot[{"\:4e8c\:6c60\:53cc\:6ee1\:6f5c", "\:9650\:5b9a\:53cc\:6ee1\:6f5c"}, 1200]
pdf = grand[{"\:4e8c\:6c60\:53cc\:6ee1\:6f5c", "\:9650\:5b9a\:53cc\:6ee1\:6f5c"}, 1600]
Export["limited pool/finish_six_pdf.png", pdf, Background -> None];
Export["limited pool/finish_six_cdf.png", cdf, Background -> None];



