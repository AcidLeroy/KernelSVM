function [X1,X2,y]=fibonacci_data(N, seed)
   rng(seed)
   theta=rand(1,N)*(log10(3.5*pi));
   theta=10.^theta+pi;
   theta=4*pi-theta;
   a=0.01;
   b=0.2;

   r=a*exp(b*theta);
   x1=r.*cos(theta);
   y1=r.*sin(theta);
   d=0.14*sqrt(x1.^2 + y1.^2);
   rng(seed)
   x1=x1+randn(size(x1)).*d;

   rng(seed)
   y1=y1+randn(size(y1)).*d;
   X1=[x1;y1];

   x2=r.*cos(theta+pi);
   y2=r.*sin(theta+pi);
   d=0.14*sqrt(x2.^2 + y2.^2);
   rng(seed)
   x2=x2+randn(size(x2)).*d;

   rng(seed)
   y2=y2+randn(size(y2)).*d;
   X2=[x2;y2];
   y=[ones(1,N) -ones(1,N)]';
end