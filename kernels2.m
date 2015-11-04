function kernels2
%This is a toy example of the solution of the XOR problem using kernels and
%ridge regression, which regularizes the kernel matrix with a small diagonal
%You can try and change the value of the diagonal (gamma) and the kernel 
%parameter (sigma) 

%randn('seed',0);
rng('default')
seed = rng(1); 
gamma=2;                                   % Ridge regression parameter 
sigma=1;                                   % Gaussian kernel parameter

c=[1 -1 -1 1;1 -1 1 -1];                   % Centers of the 4 clusters

% Generation of 400 datapoints.
num_points = 400; 
[x,y] = generate_xor_data( num_points, seed);
% x=[repmat(c(:,1:2),1,100) repmat(c(:,3:4),1,100)];
% x=x+0.4*randn(size(x));
% y=[ones(1,200) -ones(1,200)]';
% Plot the data 
% figure(1)
% plot(x(1,1:200),x(2,1:200),'.');
% hold on
% plot(x(1,201:end),x(2,201:end),'r.');

new_fig = plot_xor_2d(x);
K=kernel_matrix('rbf',x,x,sigma)+1;       % Construct the kernel matrix
alpha=pinv(K+gamma*eye(size(K)))*y;       % Compute the dual parameters 
                                          % Note the use of a diag matrix.
[X1,X2] = meshgrid(-3:.05:3, -3:.05:3);     % Costruct a grid of points for 
                                          % representation of the data.
xt=[X1(:) X2(:)]';                        % Vectorize it to use it in test 
y_=alpha'*kernel_matrix('rbf',x,xt,sigma);%+sum(alpha);    
                                          % Test
Z=buffer(y_,size(X1,1),0);                % convert the output vector into 
                                          % a matrix for representation
figure(2)
surfc(X1,X2,Z)                             % Plot the output
shading interp
camlight right
view([-40 40])

hold off
figure(1)                                 % Plot a contour over the data. 
contour(X1,X2,Z,[0 0],'LineWidth',2,'Color','Black')
hold off
