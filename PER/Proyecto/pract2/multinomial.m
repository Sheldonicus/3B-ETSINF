% Computes the error rate of 
% of the test set Y with respect to training set X
% X  is a n x d training data matrix 
% xl is a n x 1 training label vector 
% Y is a m x d test data matrix
% yl is a m x 1 test label vector 
% epsilon is a value to use in Laplace
function [etr,edv]= multinomial(Xtr,xltr,Xdv,xldvl,epsilon)

%sacamos clases y numero de clases
etiquetas=unique(xltr);


for j = etiquetas'
    priori = length(find(j==xltr))/length(Xtr);
    numerador = sum(Xtr(find(j==xltr),:));
    total = numerador ./ sum(numerador);

    Wco(1, j+1) = priori;
    Wc(j+1,:) = total;
end

%Aplicamos suavizado de Laplace
Wc = (Wc +epsilon) ./ sum(Wc +epsilon);

Wco = log(Wco);
Wc = log(Wc);

%Error test
gx = Xtr * Wc' + Wco;
[valor, ind] = max(gx,[],2);
% percentage of error
etr = mean((ind -1)!=xltr)*100; 


%Error validacion
gx = Xdv * Wc' + Wco;
[valor, ind] = max(gx,[],2);
% percentage of error
edv = mean((ind -1)!=xldvl)*100; 


endfunction
