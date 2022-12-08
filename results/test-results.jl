#!/usr/bin/julia
using CSV, Plots, Printf, DataFrames, Statistics

# get files and directories
(root, dirs, files) = walkdir(".");

# main loop
for r in root[2]
	local mach = r
	local arch = chomp(read(@sprintf("%s/machine-arch.txt", mach), String));
	@printf("Running Data Analysis and Compilation for %s (%s)\n", mach, arch);

	if (arch == "x86_64" || arch == "aarch64")
		tests = ["float", "double", "05-11", "16-16", "32-32"]
	else
		tests = ["float", "double", "05-11", "16-16"]
	end

	for t in tests
		for op in ["rect", "trap", "sin"]
			df_out = DataFrame();

			if (op == "sin")
				num_list = [1, 2, 3, 4, 5, 6, 7];
			else
				num_list = [1, 2, 4, 8, 10,
					    20, 40, 80, 100,
					    200, 400, 800, 1000];
			end

			for i in num_list

				df_tmp = DataFrame([[i]], [op]);

				local f = @sprintf("./%s/perf-csv/perf-test-%s-%s-%d.csv", mach, t, op, i);
				local df = DataFrame(CSV.File(f));

				if (arch == "x86_64")
					df = filter(row->typeof(row.energy) != String7, df)
				end

				df = filter(row->typeof(row.time) != String7, df)
				df = filter(row->typeof(row."l1-icache-load-misses") != String7, df)
				df = filter(row->typeof(row."l1-dcache-load-misses") != String7, df)

				if (isempty(df))
					continue
				end

				df[!,"l1-icache-miss-rate"] = df."l1-icache-load-misses" ./ df.instructions
				df[!,"l1-dcache-miss-rate"] = df."l1-dcache-load-misses" ./ df."l1-dcache-loads"
				
				if (arch == "x86_64")
					df[!,"power"] = df.energy ./ df.time
					df[!,"energy-delay"] = df.energy .* df.time
					df[!,"energy-delay-2"] = df.energy .* df.time .* df.time

				end

				df_tmp[!,"time"] = [Statistics.mean(df.time)]
				df_tmp[!,"l1-icache-miss-rate"] = [Statistics.mean(df."l1-icache-miss-rate")] 
				df_tmp[!,"l1-dcache-miss-rate"] = [Statistics.mean(df."l1-dcache-miss-rate")] 
				
				if (arch == "x86_64")
					df_tmp[!,"energy"] = [Statistics.mean(df.energy)] 
					df_tmp[!,"power"] = [Statistics.mean(df.power)]
					df_tmp[!,"energy-delay"] = [Statistics.mean(df."energy-delay")] 
					df_tmp[!,"energy-delay-2"] = [Statistics.mean(df."energy-delay-2")] 
				end

				df_tmp[!,"l1-icache-miss-rate"] = [Statistics.mean(df."l1-icache-miss-rate")] 
				df_tmp[!,"l1-dcache-miss-rate"] = [Statistics.mean(df."l1-dcache-miss-rate")] 

				df_out = append!(df_out, df_tmp)

				#@printf("%s: %s-%s-%d\n", r, t, op, i)
			end

			println(df_out)
		end
	end
end
