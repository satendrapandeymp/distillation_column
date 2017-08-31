function [x,y] = botu(b,r,xb,n)
global Alpha;
v = r*b;
components=length(xb);
x=-1*ones(n,components);
y=x;
x(1,:)=xb;
l = v + b;
for r = 1:n
    for c = 1:components
        y(r,c)=(x(r,c)*Alpha(c))/(x(r,1)*Alpha(1) + x(r,2)*Alpha(2) + x(r,3)*Alpha(3));
        x(r+1,c)=(b*xb(1,c)+v*y(r,c))/l;
    end
end
plot(x(:,1),x(:,2), 'r--*');
hold on
plot([1 0],[0 1],'k','Linewidth',1);
end