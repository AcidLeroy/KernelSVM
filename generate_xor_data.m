function [ x, y ] = generate_xor_data( num_points, seed )
%GENERATE_XOR_DATA Generate points 

x_points = floor(num_points / 4);
y_points = floor(num_points / 2); 

c=[1 -1 -1 1;1 -1 1 -1];                   % Centers of the 4 clusters
x=[repmat(c(:,1:2),1,x_points) repmat(c(:,3:4),1,x_points)];
rng(seed);
x=x+0.4*randn(size(x));
y=[ones(1,y_points) -ones(1,y_points)]';

end

