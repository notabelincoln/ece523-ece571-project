% Abe Jordan
% ECE 523 / ECE 571
% Project
% test_results.m
clear;

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

