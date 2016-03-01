function [s,valuesofErr] = trapRule(f,a,b,m,c)

% f is the function
% a and b are the limits
% m is the number of subintervals
% c is the exact integral

disp(['--------------------------------'])
disp(['    Step     ', ' Approx     ','Error'])
disp(['    sizeh    ',' solution    ',''])
disp(['--------------------------------'])

valuesofErr = zeros(1,m);
for i=0 : m
    m = 2^i;
    h = (b-a)/m;
    s = 0;
    for k=1 : (m-1)
        x = a+h*k;
        s = s+feval(f,x);
    end
    
    s = h*(feval(f,a)+feval(f,b))/2+h*s;
    err = abs(c-s);
    valuesofErr(i+1) = err;
    disp([h s err])
end
end

