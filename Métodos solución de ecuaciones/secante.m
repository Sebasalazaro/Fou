clear
clc
format long
x0=-3;
x1=-2;

fprintf('         raiz            error\n')
final=0;
while final == 0
    f0= abs(x0)^(x0-1) - 2.5*x0 - 5 ;
    f1= abs(x1)^(x1-1) - 2.5*x1 - 5;
    x2=x1-(x1-x0)*f1/(f1-f0);
    error=abs(x2-x1);
    disp([x2,error])
    x0=x1;
    x1=x2;
    if error == 0
        final = 1
    end
end
fprintf('Raiz de funcion es %1.9f\n',x2)