function dy = odefun(t,y,m,b,k,u)

dy(1) = y(2);
dy(2) = (1/m) * (-k*y(1) - b*y(2) + u(t));

dy = dy';
end

