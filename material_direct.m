function [b,d] = material_direct(xdc, r, n1, n2)
% Input is -- material_direct(1e-14, 11.3, 450, 540); for Alpha = 1.2, 
%  material_direct(1e-14, 2.14, 140, 140); For Alpha = 2
% filling up feed and composition
f = 100;
z = [.3333 .3333 .3333];
za = z(1);

% Distillate
xdb = .01;
xda = 1 - xdb - xdc;

% Bottom 
xba = .01;

% Set Value of Alpha
global Alpha;
Alpha = [1.44 1.2 1];

% Calculating bottom and distillate
b = f * (xda-za)/(xda-xba);
d = f * (xba-za)/(xba-xda);
% defining compositions for direct split
xbb = (f*z(2) - d * xdb)/b;
xbc = 1 - xba - xbb;
xd = [xda xdb xdc];
xb = [xba xbb xbc];
% Function calls for rectifying and striping section
rb = (r*d + d)/b;
botu(b, rb , xb, n2);
topd(d, r, xd, n1);
% Input was  --  material(.99, .01, 1e-12, 1.85,1.85, 100, 100);
end