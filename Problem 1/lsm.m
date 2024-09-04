function [theta,m_hat,k_hat,b_hat] = lsm(y,f,r1,r2)
theta = mrdivide(y' * f, f' * f)';

m_hat = 1/theta(3);
k_hat = (theta(2) + r1*r2)*m_hat;
b_hat = (theta(1) + r1 + r2)*m_hat;
end

