%Two Fibonaci spirals
function f = plot_fibonacci_spirals(X1, X2)
m_size = 15;
f = figure();
plot(X1(1,:),X1(2,:),'r.','markersize', m_size)
hold on
plot(X2(1,:),X2(2,:),'.','markersize', m_size)
%x=[X1 X2];
hold off
axis equal





