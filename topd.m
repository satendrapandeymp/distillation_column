function [x,y] = topd(d,r,xd,n)
global Alpha;
l = r*d;
components=length(xd);
x=-1*ones(n,components);
y=x;
y(1,:)=xd;
v = l + d;
for r = 1:n
    for c = 1:components
        x(r,c)=(y(r,c)/Alpha(c))/((y(r,1)/Alpha(1)) + (y(r,2)/Alpha(2)) + (y(r,3)/Alpha(3)));
        y(r+1,c)=(d*xd(1,c)+l*x(r,c))/v;
    end
end
plot(x(:,1),x(:,2), 'b--*');
hold on
plot([1 0],[0 1],'k','Linewidth',1);
end