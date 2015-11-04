function [ contour_plot, plot_3d ] = plot_decision( x, y, gamma, sigma, pt_density, data_fig )
%PLOT_DECISION 
K=kernel_matrix('rbf',x',x',sigma)+1;       % Construct the kernel matrix
alpha=pinv(K+gamma*eye(size(K)))*y;       % Compute the dual parameters 
                                          % Note the use of a diag matrix.

min_x_row = min(x); min_x_row = min_x_row(1); 
min_x_col = min(x); min_x_col = min_x_col(1); 

max_x_row = max(x); max_x_row = max_x_row(1); 
max_x_col = max(x); max_x_col = max_x_col(1); 

row_pts = linspace(min_x_row, max_x_row, pt_density); 
col_pts = linspace(min_x_col, max_x_col, pt_density); 

[X1,X2] = meshgrid(row_pts, col_pts);

                                          % representation of the data.
xt=[X1(:) X2(:)]';                        % Vectorize it to use it in test 
y_=alpha'*kernel_matrix('rbf',x',xt,sigma) + sum(alpha);    
                                          % Test
Z=buffer(y_,size(X1,1),0);                % convert the output vector into 
                                          % a matrix for representation
contour_plot = figure();
surfc(X1,X2,Z)                            % Plot the output
shading interp
camlight right
view([-40 40])
title('Separation of points in 3d')

hold off
plot_3d = figure(data_fig);                                % Plot a contour over the data. 
hold on; 
contour(X1,X2,Z,[0 0],'LineWidth',2,'Color','Black')
title('Hyperplane projected in 2d')
hold off


end

