%% Initialization
clear ; close all; clc

%% =============== Part 1: Linear kernel ================
%  We start the exercise by first loading and visualizing data1.mat. 
%  The following code will load the dataset into your environment and plot
%  the data.
%

fprintf('Loading and Visualizing data1.mat ...\n')

% Load X and y
load('data1.mat');

% Plot training data
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  The following code will train a linear SVM on the dataset and plot the
%  decision boundary learned.

fprintf('\nTraining Linear SVM ...\n')

% You should try to change the C value below and see how the decision
% boundary varies (e.g., try C = 1000)
C = 1;

model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);

visualizeBoundaryLinear(X, y, model);

fprintf('Program paused. Press enter to test your implementation of Gaussian kernel.\n');
pause;

%% =============== Part 2: Gaussian kernel ================

%  The following code will load the next dataset into your environment and 
%  plot the data. 
%

printf('Loading and Visualizing data2.mat ...\n')

% Load from data2: 
% You will have X, y in your environment
load('data2.mat');

% Plot training data
plotData(X, y);

printf('\nProgram paused. Press enter to continue.\n');
pause;

%  The following code will test your implementation of Gaussian kernel

fprintf('Evaluating the Gaussian Kernel ...\n')

x1 = [3; 5; 1; 6]; x2 = [-4; 4; -8; 0]; sigma = 10;
sim = gaussianKernel(x1, x2, sigma);

printf("Using x1 = [3; 5; 1; 6], x2 = [-4; 4; -8; 0] and sigma = 10\n");
printf("sim = gaussianKernel(x1, x2, sigma)\n");

printf("  Expected value for sim: 0.433874\n");
printf("Calculated value for sim: %f\n", sim);

printf('\nProgram paused. Press enter to continue.\n');
pause;

%  After you have implemented the kernel, we can now use it to train the 
%  SVM classifier.

printf('Training SVM with Gaussian Kernel ...\n');

% SVM Parameters
C = 1; 
sigma = 0.1;

% We set the max_passes lower here so that the code will run faster.
% However, in practice, you will want to run the training to convergence.
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
visualizeBoundary(X, y, model);

printf("Calculating the accuracy on the training set...\n");

[pred, scores] = svmPredict(model, X);

accurracy = mean(pred == y)

