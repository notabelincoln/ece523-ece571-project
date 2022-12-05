% Abe Jordan
% ECE 523 / ECE 571
% Project
% test_results.m
clc;
clear;
scale = [1, 2, 4, 8, 10, 20, 40, 80, 100, 200, 400, 800, 1000];
%% sin 5-11
% plots
figure('name', '5-11 sin');
hold on;
for i = 1:7
    data_file = sprintf('results-test-05-11-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(x, sin(x), 'linewidth', 1.5);

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('sin(x)')

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7', 'MATLAB');
hold off;

% error
figure('name', '5-11 sin error');
hold on;
for i = 1:7
    data_file = sprintf('results-test-05-11-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - sin(x)));
end

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7');
hold off;

% energy and power
ofile = fopen('test-05-11-sin-data.csv' , 'w');
fprintf(ofile, 'taylor_terms,energy,time,power\n');
for i = 1:7
    energy_file = sprintf('perf-test-05-11-sin-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("05-11 sin %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-05-11-sin-%d-time.csv', i);
    time_data = importdata(energy_file);
    fprintf("05-11 sin %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("05-11 sin %d Power Avg: %f W\n", i, mean(power_data));

    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);

%% sin 16-16
figure('name', '16-16 sin');
hold on;
for i = 1:7
    data_file = sprintf('results-test-16-16-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(x, sin(x), 'linewidth', 1.5);

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('sin(x)');

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7', 'MATLAB');
hold off;

% error
figure('name', '16-16 sin error');
hold on;
for i = 1:7
    data_file = sprintf('results-test-16-16-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - sin(x)));
end

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7');
hold off;

% energy and power
ofile = fopen('test-16-16-sin-data.csv' , 'w');
fprintf(ofile, 'taylor_terms,energy,time,power\n');
for i = 1:7
    energy_file = sprintf('perf-test-16-16-sin-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("16-16 sin %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-16-16-sin-%d-time.csv', i);
    time_data = importdata(energy_file);
    fprintf("16-16 sin %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("16-16 sin %d Power Avg: %f W\n", i, mean(power_data));

    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);

%% sin 32-32
figure('name', '32-32 sin');
hold on;
for i = 1:7
    data_file = sprintf('results-test-32-32-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(x, sin(x), 'linewidth', 1.5);

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('sin(x)');

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7', 'MATLAB');
hold off;

% error
figure('name', '32-32 sin error');
hold on;
for i = 1:7
    data_file = sprintf('results-test-32-32-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - sin(x)));
end

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7');
hold off;

% energy and power
ofile = fopen('test-32-32-sin-data.csv' , 'w');
fprintf(ofile, 'taylor_terms,energy,time,power\n');
for i = 1:7
    energy_file = sprintf('perf-test-32-32-sin-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("32-32 sin %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-32-32-sin-%d-time.csv', i);
    time_data = importdata(energy_file);
    fprintf("32-32 sin %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("32-32 sin %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);

%% sin float
figure('name', 'float sin');
hold on;
for i = 1:7
    data_file = sprintf('results-test-float-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(x, sin(x), 'linewidth', 1.5);

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('sin(x)');

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7', 'MATLAB');
hold off;

% error
figure('name', 'float sin error');
hold on;
for i = 1:7
    data_file = sprintf('results-test-float-sin-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - sin(x)));
end

xlim([-4*pi 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')

legend('N = 1', 'N = 2', 'N = 3', 'N = 4', 'N = 5', 'N = 6', 'N = 7');
hold off;

% energy and power
ofile = fopen('test-float-sin-data.csv' , 'w');
fprintf(ofile, 'taylor_terms,energy,time,power\n');
for i = 1:7
    energy_file = sprintf('perf-test-float-sin-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("float sin %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-float-sin-%d-time.csv', i);
    time_data = importdata(energy_file);
    fprintf("float sin %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("float sin %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% rect 5-11
% plots
figure('name', '5-11 rect');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '5-11 rect error');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-05-11-rect-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-05-11-rect-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("05-11 rect %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-05-11-rect-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("05-11 rect %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("05-11 rect %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% rect 16-16
% plots
figure('name', '16-16 rect');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '16-16 rect error');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-16-16-rect-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-16-16-rect-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("16-16 rect %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-16-16-rect-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("16-16 rect %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("16-16 rect %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% rect 32-32
% plots
figure('name', '32-32 rect');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end


plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '32-32 rect error');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-32-32-rect-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-32-32-rect-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("32-32 rect %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-32-32-rect-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("32-32 rect %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("32-32 rect %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% rect float
% plots
figure('name', 'float rect');
hold on;
for i = scale
    data_file = sprintf('results-test-float-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end


plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', 'float rect error');
hold on;
for i = scale
    data_file = sprintf('results-test-float-rect-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-float-rect-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-float-rect-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("float rect %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-float-rect-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("float rect %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("float rect %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% trap 5-11
% plots
figure('name', '5-11 trap');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '5-11 trap error');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-05-11-trap-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-05-11-trap-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("05-11 trap %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-05-11-trap-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("05-11 trap %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("05-11 trap %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);

%% trap 16-16
% plots
figure('name', '16-16 trap');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '16-16 trap error');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-16-16-trap-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-16-16-trap-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("16-16 trap %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-16-16-trap-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("16-16 trap %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("16-16 trap %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% trap 32-32
% plots
figure('name', '32-32 trap');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '32-32 trap error');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-32-32-trap-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-32-32-trap-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("32-32 trap %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-32-32-trap-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("32-32 trap %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("32-32 trap %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% trap float
% plots
figure('name', 'float trap');
hold on;
for i = scale
    data_file = sprintf('results-test-float-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', 'float trap error');
hold on;
for i = scale
    data_file = sprintf('results-test-float-trap-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-float-trap-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-float-trap-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("float trap %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-float-trap-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("float trap %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("float trap %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% simp 5-11
% plots
figure('name', '5-11 simp');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '5-11 simp error');
hold on;
for i = scale
    data_file = sprintf('results-test-05-11-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-05-11-simp-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-05-11-simp-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("05-11 simp %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-05-11-simp-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("05-11 simp %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("05-11 simp %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% simp 16-16
% plots
figure('name', '16-16 simp');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '16-16 simp error');
hold on;
for i = scale
    data_file = sprintf('results-test-16-16-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-16-16-simp-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-16-16-simp-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("16-16 simp %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-16-16-simp-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("16-16 simp %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("16-16 simp %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% simp 32-32
% plots
figure('name', '32-32 simp');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', '32-32 simp error');
hold on;
for i = scale
    data_file = sprintf('results-test-32-32-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-32-32-simp-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-32-32-simp-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("32-32 simp %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-32-32-simp-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("32-32 simp %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("32-32 simp %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


%% simp float
% plots
figure('name', 'float simp');
hold on;
for i = scale
    data_file = sprintf('results-test-float-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, y);
end

plot(0:0.01:4*pi, cos(0) - cos(0:0.01:4*pi), 'linewidth', 1.5);

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('\int_{0}^{x}sin(t)dt', 'interpreter', 'tex')
hold off;

% error
figure('name', 'float simp error');
hold on;
for i = scale
    data_file = sprintf('results-test-float-simp-%d.csv', i);
    data = importdata(data_file);
    x = data.data(:,1);
    y = data.data(:,2);
    plot(x, abs(y - -(cos(x) - cos(0))));
end

xlim([0 4*pi]);
grid on;

xlabel('x');
ylabel('Absolute Error')
hold off;

% energy and power
ofile = fopen('test-float-simp-data.csv' , 'w');
fprintf(ofile, 'x_scale,energy,time,power\n');
for i = scale
    energy_file = sprintf('perf-test-float-simp-%d-energy.csv', i);
    energy_data = importdata(energy_file);
    fprintf("float simp %d Energy Avg: %f J\n", i, mean(energy_data));

    time_file = sprintf('perf-test-float-simp-%d-time.csv', i);
    time_data = importdata(time_file);
    fprintf("float simp %d Time Avg: %f s\n", i, mean(time_data));

    power_data = energy_data ./ time_data;
    fprintf("float simp %d Power Avg: %f W\n", i, mean(power_data));
    
    fprintf(ofile, '%d,%f,%f,%f\n', i, mean(energy_data), mean(time_data), ...
        mean(power_data));
end

fclose(ofile);


