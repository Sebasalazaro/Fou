%Newton: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 

function [n,xn,fm,dfm,E] = newton(x0,Tol,niter)
    syms x
        f=(pi^-x)*(-1+x)+(x^(2/3))-10;                                                                          
        df=diff(f);
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm = eval(subs(df,x0));
        dfe=dfm;
        E(c+1)=Tol+1;
        error=E(c+1);
        xn=x0;
        Resultados = [];
        while error>Tol 
            xn=x0-fe/dfe;
            fm(c+2)=eval(subs(f,xn));
            fe=fm(c+2);
            dfm=eval(subs(df,xn));
            dfe=dfm;
            E(c+2)=abs(xn-x0);
            error=E(c+2);
            x0=xn;
            c=c+1;
            Resultados = [Resultados ; [c, x0, fe, error]];
        end
        nombres = {'Iteración (n)','Raíces (Xn)','Ecuación (f(Xn))','Error'};
        tabla = array2table(Resultados, 'VariableNames',nombres);
       
        if fe==0
           s=x0;
           n=c;
           fprintf('%f es raiz de f(x) \n\n\n',x0);
           disp(tabla)
        elseif error<Tol
           s=x0;
           n=c;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n\n\n',x0,Tol);
           disp(tabla)
        elseif dfe==0
           s=x0;
           n=c;
           fprintf('%f es una posible raiz múltiple de f(x) \n\n\n',x0);
           disp(tabla)
        else 
           s=x0;
           n=c;
           fprintf('Fracasó en %f iteraciones \n\n\n',niter);
           disp(tabla)
        end
        
end