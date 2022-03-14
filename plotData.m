function plotData(X, y)
% Plots the data points with + for the positive examples and o for the negative examples. 
%   X is assumed to be a mx2 matrix.
%   y is assumed to contain 0 and 1s.

	% Find Indices of Positive and Negative Examples
	pos = find(y == 1); 
	neg = find(y == 0);

	plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 1, 'MarkerSize', 10)
	hold on;
	plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 10)
	hold off;

	set(gca, 'linewidth', 2, 'fontsize', 22);
end
