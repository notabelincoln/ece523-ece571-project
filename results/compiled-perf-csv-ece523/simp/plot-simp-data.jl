#!/usr/bin/julia

using Plots, CSV, DataFrames, Printf, StatsPlots

legend_names = ["5.11" "16.16" "32.32" "Float" "Double"]
y_labels = Dict("energy"=>"Energy (J)", "error"=>"Absolute Error",
		"time"=>"Time (s)", "power"=>"Power (W)")

for m in ["energy", "error", "time", "power"]
	local df = DataFrame(CSV.File(@sprintf("simp-%s.csv", m)));
	local y_max = 1.1 * maximum(Matrix(df[:,2:end]));

	local plt = groupedbar(Matrix(df[:,2:end]),
			       ylims = (0, y_max),
			       xticks = (1:nrow(df), string.(df[:,1])),
			       xlabel = "x Scaling Factor",
			       ylabel = y_labels[m],
			       label = legend_names,
			       framestyle = :box);
	savefig(plt, @sprintf("simp-%s.png", m));
end
