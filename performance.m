function [ error_rate ] = performance( x_train, y_train, x_test, y_test, gamma, sigma)
%PERFORMANCE Check performance using 5fold cross validation
K=kernel_matrix('rbf',x_train, x_train,sigma) + 1; 
alpha=pinv(K+gamma*eye(size(K)))*y_train; 
y_ = sign(alpha'*kernel_matrix('rbf', x_train, x_test, sigma) + sum(alpha));
error_rate = 1 - sum(y_'==y_test)/numel(y_test);
fprintf('Error rate: %f for gamma = %f, sigma = %f \n', error_rate, gamma, sigma); 

end


