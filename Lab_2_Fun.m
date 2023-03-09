function [z] = Lab_2_Fun(x1,y1)
s = size(x1);
for i = 1:s
    x = x1(i);
    y = y1(i);
    f = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
    z(i) = f;
end 

    