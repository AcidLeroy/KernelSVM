function R=kernel_matrix(ker,X2,X1,p1)
%Block matrix computation of kernel matrix
%X is a matrix whose columns are the vectors

switch lower(ker)
    case 'linear'
        R = X2'*X1;
    case 'poly'
        R = (X2'*X1+ones(size(X2'*X1))).^p1;
    case 'poly2'
        R = (X2'*X1).^p1;
    case 'rbf'
        N1=size(X1,2);
        N2=size(X2,2);
        aux=[kron(X1',ones(N2,1))- kron(ones(1,N1),X2)'];
        D=buffer(sum(aux.*conj(aux),2),N2,0);
        R=exp(-D/(2*p1^2));
    case 'laplace'
        N1=size(X1,2);
        N2=size(X2,2);
        aux=[kron(X1',ones(N2,1))- kron(ones(1,N1),X2)'];
        D=buffer(sum(aux.*conj(aux),2),N2,0);
        R=exp(-sqrt(D)/p1);
    otherwise
        fprintf(ker)
        error('Unknown kernel')
end
