#!/usr/bin/julia

using Plots, CSV, DataFrames, Printf, StatsPlots

legend_names = Dict("05-11"=>"5.11", "16-16"=>"16.16", "32-32"=>"32.32",
		    "float"=>"Float", "double"=>"Double");
y_labels = Dict("energy"=>"Energy (J)", "error"=>"Absolute Error",
		"time"=>"Time (s)", "power"=>"Power (W)")

df_error = DataFrame(CSV.File(@sprintf("trap-error.csv")));

for m in ["energy", "time", "power"]
	local df_m = DataFrame(CSV.File(@sprintf("trap-%s.csv", m)));
	local plt = plot();
	for t in ["05-11", "16-16", "32-32", "float", "double"]

		local df_t = DataFrame([df_error[:,t]], ["error"]);
		local df_t[!,m] = df_m[:,t]

		plt = plot!(Vector(df_t[:,"error"]),
			       Vector(df_t[:,m]),
			       marker = (:circle,5),
			       xlabel = "Absolute Error",
			       ylabel = y_labels[m],
			       framestyle = :box,
			       label = legend_names[t]);
		println(df_t);

	end

	savefig(plt, @sprintf("trap-error-%s.png",m));
end
