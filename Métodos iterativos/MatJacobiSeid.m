%MatJacobiSeid: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método de Jacobi o
%de Gauss Seidel (Matricial), depende del método elegido, se elige 0 o 1 en met
%respectivamente

function [E,s,T,radio,Tabla] = MatJacobiSeid(x0,A,b,Tol,niter,met)
    c=0;
    error=Tol+1;
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,+1);
    Tabla = table(c, x0(1),x0(2),x0(3));
    while error>Tol && c<niter
        if met==0
            T=inv(D)*(L+U);
            C=inv(D)*b;
            x1=T*x0+C;
        end
        if met==1
            T=inv(D-L)*(U);
            C=inv(D-L)*b;
            x1=T*x0+C;
            Tabla = table(c, x0(1),x0(2),x0(3));
        end
        E(c+1)=norm((x1-x0)./x1,'inf');
        error=E(c+1);
        
        x0=x1;
        c=c+1;
        radio = max(abs(eig(T)));
        
    end
    
     % 'VariableNames', {'Raíces obtenidas','Mark', 'Raíces ordenadas(X->Y->Z)'});
    if error < Tol
        s=x0;
        n=c;
        s
        T
        radio
        Tabla
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        s=x0;
        n=c;
        fprintf('Fracasó en %f iteraciones',niter) 
    end
end