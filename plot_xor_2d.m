function [ f_handle ] = plot_xor_2d(x)
%PLOT_XOR_2D Plot the 2d xor data. Assume that the first half of the data
%is classified one way, and the second half is classified another. Hence
%why "y" does not need to passed in. 

f_handle = figure(); 
mid_point = floor(size(x, 2) / 2); 
m_size = 15; 
plot(x(1,1:mid_point),x(2,1:mid_point),'.','markersize', m_size);
hold on
plot(x(1,(mid_point+1):end),x(2,(mid_point+1):end),'r.','markersize', m_size);

end

