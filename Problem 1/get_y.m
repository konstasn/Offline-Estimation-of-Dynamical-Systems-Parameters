function y_hat = get_y(t,m_hat,b_hat,k_hat,u,y0)

[t,state_hat] = ode45(@(t,state_hat)odefun(t,state_hat,m_hat,b_hat,k_hat,u), t,y0);
y_hat = state_hat(:,1);
end

