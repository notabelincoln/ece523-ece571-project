#!/usr/bin/julia

using Plots, CSV, DataFrames, Statistics, Printf

abs_error(guess, real) = abs(guess - real);

DATA_FOLDER = "go-cheems/output";

# assign the csv name
csv_name = @sprintf("output-test-32-32-rect-100.csv");

# get the full file path
csv_name_full = @sprintf("%s/%s", DATA_FOLDER, csv_name);

# import the data
df = DataFrame(CSV.File(csv_name_full));
df

for row in eachrow(df)
	@printf("%lf,%lf,%lf,%lf\n", row.x, row.rect, 1 - cos(row.x), abs_error(row.rect, 1 - cos(row.x)));
end

plt = plot(df.x, df.rect);
plt = plot!(df.x, 1 .- cos.(df.x));

savefig(plt, "test.png");

