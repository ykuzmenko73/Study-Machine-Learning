function [C, sigma] = dataset3Params_eval(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_vect = [0.01 0.03 0.1 0.3 1 10 30]';
Sigma_vect = [0.01 0.03 0.1 0.3 1 10 30]';

err = -1;
bestErr = -1;

for i=1:length(C_vect)
	c = C_vect(i);
	for j=1:length(Sigma_vect)
		s = Sigma_vect(j);
		fprintf("Trying C=%f, sigma=%f", c, s);
		model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 
		predictions = svmPredict(model, Xval);
		err = mean(double(predictions ~= yval));
		if bestErr == -1 || err < bestErr 
			bestErr = err;
			C = c;
			sigma = s;
			fprintf(" - FOUND NEW BEST ERR=%d\n", err);
		else
			fprintf(" - ignoring err=%d\n", err);
		endif
		fprintf("===============================================\n", err);
	end
end

fprintf("Best err=%f at C=%f and sigma=%f\n", bestErr, C, sigma);

% =========================================================================

end
