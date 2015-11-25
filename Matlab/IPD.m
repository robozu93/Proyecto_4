function [out] = IPD(ref,y)

y_ant = 0;
i_ant = 0;

n = length(y);
out = zeros(1,n);

mat_I = ones(1,n);
mat_P = ones(1,n);
mat_D = ones(1,n);

for j = 1:1:n
    
%     sin truncamiento    
%     p = 36*y(j);
%     e = ref - y(j);
%     i = 14*e + i_ant;
%     d = 300*(y(j) - y_ant);
  
%     con truncamiento    
    p = (36/256)*y(j);
    e = ref - y(j);
    i = (7/128)*e + i_ant;
    d = (75/64)*(y(j) - y_ant);
    
    out(j) = i - p - d;
    
    y_ant = y(j);
    i_ant = i;
    
    mat_I(j) = i;
    mat_P(j) = p;
    mat_D(j) = d; 
end

end

