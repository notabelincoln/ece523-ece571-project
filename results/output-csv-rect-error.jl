#!/usr/bin/julia

using Plots, CSV, DataFrames, Statistics, Printf

find_abs_error_mean(guess, real) = Statistics.mean(abs.(guess - real));

DATA_FOLDER = "go-cheems/output";

x_scales = [1, 2, 4, 8, 10, 20, 40, 80, 100, 200, 400, 800, 1000];
test_types = ["05-11", "16-16", "32-32", "float", "double"];

df_out = DataFrame([[],[],[],[],[],[]], ["x_scale", "05-11", "16-16", "32-32", "float", "double"]);

for i in x_scales
	df_tmp = DataFrame([[i]], ["x_scale"]);

	for t in test_types
		# assign the csv name
		local csv_name = @sprintf("output-test-%s-rect-%d.csv", t, i);

		# get the full file path
		local csv_name_full = @sprintf("%s/%s", DATA_FOLDER, csv_name);

		# import the data
		local df = DataFrame(CSV.File(csv_name_full));

		# compute average percent error 
		local avg_error = find_abs_error_mean(df.rect, 1 .- cos.(df.x));

		df_tmp[!,t] = [avg_error];

		#@printf("Average absolute error %s %d: %0.32lf\n", t, i, avg_error);

		#plt = plot(df.x, df.simpsons - (1 .- cos.(df.x)));
		#savefig(plt, @sprintf("test-rect-%s-%d.png", t, i))
	end

	global df_out = append!(df_out, df_tmp);
end

f_out_name = "./compiled-perf-csv-ece523/test-rect-error.csv";
CSV.write(f_out_name, df_out);


