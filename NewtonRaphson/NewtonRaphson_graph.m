function NewtonRaphson_graph( f,fd,x1,epsilon,max,a,b )

xVeg = NewtonRaphson(f,fd,x1,epsilon,max);

hold on;

x = linspace(a,b,100);
y = f(x);
xx = linspace(a,b,100);

plot([a,b],[0,0], 'red');
plot([0,0],[a,b], 'red');
plot(x,y, 'blue');
[~,n] = size(xVeg);

for i = 1:n
    tang = (xx-xVeg(i)) * fd(xVeg(i)) + f(xVeg(i));
    plot(xx,tang,'green');
end

end

