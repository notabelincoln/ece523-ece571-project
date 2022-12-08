#!/usr/bin/julia
using CSV, Plots, Printf, DataFrames

# get files and directories
(root, dirs, files) = walkdir(".");

# main loop
for r in ["ampere", "mini-cheems", "lord-cheems"]
	local mach = r
	local arch = chomp(read(@sprintf("%s/machine-arch.txt", mach), String));
	@printf("Running Data Analysis and Compilation for %s (%s)\n", mach, arch);

	# TODO: add check for 32-32 value support on architecture
	
	if (arch == "x86_64" || arch == "aarch64")
		tests = ["float", "double", "05-11", "16-16", "32-32"]
	else
		tests = ["float", "double", "05-11", "16-16"]
	end

	for t in tests
		for op in ["rect", "trap", "sin"]
			if (op == "sin")
				num_list = [1, 2, 3, 4, 5, 6, 7];
			else
				num_list = [1, 2, 4, 8, 10,
					    20, 40, 80, 100,
					    200, 400, 800, 1000];
			end

			for i in num_list
				local f = @sprintf("./%s/perf-csv/perf-test-%s-%s-%d.csv", mach, t, op, i);
				local df = DataFrame(CSV.File(f));

				df[!,"l1-icache-miss-rate"] = df."l1-icache-load-misses" ./ df.instructions
				df[!,"l1-icache-miss-rate"] = df."l1-dcache-load-misses" ./ df."l1-dcache-loads"
				
				if (arch == "x86_64")
					df[!,"power"] = df.energy ./ df.time
					df[!,"energy-delay"] = df.energy .* df.time
					df[!,"energy-delay-2"] = df.energy .* df.time .* df.time
				end
				
				@printf("%s: %s-%s-%d\n", r, t, op, i)
				println(df)
			end
		end
	end
end
