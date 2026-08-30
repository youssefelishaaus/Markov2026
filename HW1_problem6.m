%% Problem 6(b)

clear;
clc;
close all;
P_exact = 23*pi/192;
N_values = round(logspace(2,7,30));
N_max = max(N_values);

X = rand(N_max,1);
Y = rand(N_max,1);
Z = rand(N_max,1);

success = (X.^2 + Y.^2 < Z) & (Z.^2 > X.*Y);

cumulative_success = cumsum(success);

P_hat = zeros(size(N_values));

for k = 1:length(N_values)

    N = N_values(k);

    P_hat(k) = cumulative_success(N)/N;

end

%% Display results

fprintf('Analytic probability = %.4f\n',P_exact);

fprintf('Monte Carlo estimate at N = %d: %.4f\n',...
    N_values(end),P_hat(end));

%% Plot

figure;

semilogx(N_values,P_hat,'o-');

hold on;

yline(P_exact,'--');

xlabel('Sample size N');

ylabel('Estimated probability');

title('Monte Carlo Estimate');

legend('Monte Carlo estimate','Analytic value',...
    'Location','best');

grid on;

xlim([min(N_values),max(N_values)]);

ylim([0.35,0.40]);

hold off;