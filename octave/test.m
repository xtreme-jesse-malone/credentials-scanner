clear; close all; clc;

[strings, a, b, c, d, y] = textread('nerds.csv', '%s %n %n %n %n %n')

X = [a, b, c, d];

plotData(X,y,strings);

[m,n] = size(X(:,2:4));

X = [ones(m, 1) X(:,2:4)];

initial_theta = zeros(n + 1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n'); 
fprintf(' %f \n', grad); 
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta,cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n'); 
fprintf(' %f \n', theta);

fprintf('\nProgram paused. Press enter to continue.\n'); 
pause;

%plotData(X,y,strings);
plot_x = linspace( min(X(:,2)), max(X(:,2)) , 100)
plot_y = linspace(min(X(:,3)), max(X(:,3)) , 100)
[xx,yy] = meshgrid(plot_x, plot_y)
z = (-1/theta(4)) .* ( theta(2) .* xx + theta(2) .* yy + theta(1))
mesh(plot_x, plot_y,z)
text(X(:,2),X(:,3),X(:,4),strings)
xlabel("alphabet cardinality")
ylabel("vowels:consonants")
zlabel("caps:lower")


