function [b,d] = material_indirect( xba, r, n1, n2)
% For Min reflux Input is --  
% material_indirect(1e-14, 5.5, 500, 500); for Alpha = 1.2, 
% material_indirect(1e-14, .99, 500, 500); For Alpha = 2
% filling up feed and composition
f = 100;
z = [.3333 .3333 .3333];
zc = z(3);
% Set Value of Alpha
global Alpha;
Alpha = [4 2 1];
xdc = .01;
xbb = .01;
xbc = 1 - xbb - xba;
% Calculating bottom and distillate
b = f * (xdc-zc)/(xdc-xbc);
d = f * (xbc-zc)/(xbc-xdc);
% defining compositions for direct split
xdb = (f*z(2) - b * xbb)/d;
xda = 1 - xdb - xdc;
xd = [xda xdb xdc];
xb = [xba xbb xbc];
% Function calls for rectifying and striping section
rb = (r*d + d)/b;

botu(b, rb , xb, n2);
topd(d, r, xd, n1);
end