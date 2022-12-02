% Abe Jordan
% ECE 523 / ECE 571
% Project
% test_results.m
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


plot(x, sin(x));

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

plot(x, sin(x));

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

plot(x, sin(x));

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

plot(x, sin(x));

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


plot(x, cos(0) - cos(x));

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


plot(x, cos(0) - cos(x));

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


plot(x, cos(0) - cos(x));

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


plot(x, cos(0) - cos(x));

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

