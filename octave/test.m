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
