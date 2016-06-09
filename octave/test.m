clear; close all; clc;

[strings, a, b, c, d, y] = textread('nerds.csv', '%s %n %n %n %n %n')

X = [a, b, c, d]


pos = find(y==1)
neg = find(y==0)
figure;

scatter3(X(:,2),X(:,3),X(:,4),10, y)
% scatter3(X(neg,2),X(neg,3),X(neg,4),10, 'blue')
text(X(:,2),X(:,3),X(:,4),strings)
xlabel("alphabet cardinality")
ylabel("vowels:consonants")
zlabel("caps:lower")

[m,n] = size(X(:,2:4))

X = [ones(m, 1) X(:,2:4)];

initial_theta = zeros(n + 1, 1);

[cost, grad] = cost(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n'); 
fprintf(' %f \n', grad); 
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta,cost] = fminunc(@(t)(cost(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n'); 
fprintf(' %f \n', theta);

fprintf('\nProgram paused. Press enter to continue.\n'); 
pause;


