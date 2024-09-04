%Clear output and memory

clc
clear

%Model parameters

m = 10;
b = 0.3;
k = 1.5;

%Initialize tspan & initial values

t = [0:0.1:10];

y0(1) = 0;
y0(2) = 0;

%Initialize external force

u =@(t) 10*sin(3*t) + 5;

%Get values of y

y = get_y(t,m,b,k,u,y0);

%Λ(s) parameter

r1 = 1;
r2 = 10;
lamda = [1 (r1+r2) r1*r2];

%Initialize ζ matrix

zeta = get_z(y,u,t,lamda);

%Run the Least Squares Method

[theta, m_hat, k_hat, b_hat] = lsm(y,zeta,r1,r2);


%Compute y_hat and error and plot

y_hat = get_y(t,m_hat,b_hat,k_hat,u,y0);

e = mean(abs(y-y_hat))

figure(1)
plot(t,y,t,y_hat)
title('y & y\_hat (r1=1,r2=10)')
xlabel('Time (seconds)')
ylabel('Distance (meters)')
legend('y','y\_hat','Location','southeast')

figure(2)
plot(t,y - y_hat)
title('Error (r1=1,r2=10)')
xlabel('Time (seconds)')
ylabel('Error (meters)')



%Find the minimum e(r1,r2)
%{
min_e = 100000;
E = zeros(100,100);
i1=1;
i2=1;
for r1 = 0.01:0.01:1
    for r2 = 0.01:0.01:1
        %Λ(s) parameter
        lamda = [1 (r1+r2) r1*r2];
        %Initialize ζ matrix
        zeta = get_z(y,u,t,lamda);
        %Run the Least Squares Method
        [theta, m_hat, k_hat, b_hat] = lsm(y,zeta,r1,r2);
        %Compute y_hat and error
        y_hat = get_y(t,m_hat,b_hat,k_hat,u,y0);

        e = mean(abs(y-y_hat));
        E(i1,i2) = e;
    
        if e < min_e
            min_e = e;
            best_r1 = r1;
            best_r2 = r2;
        end
    i2 = i2 +1;
    end
    i1 = i1 +1;
    i2 = 1;
end

%Plot e with regard to r1,r2
r1 = 0.01:0.01:1;
r2 = 0.01:0.01:1;
figure(3)
title("Error function with regard to r1,r2")
surf(r1,r2,E)

xlabel('ρ_1')
ylabel('ρ_2')
zlabel('Error (meters)')

%Plot e for the best value of r1,r2

lamda = [1 (best_r1 + best_r2) (best_r1 * best_r2)];
zeta = get_z(y,u,t,lamda);
[theta, m_hat, k_hat, b_hat] = lsm(y,zeta,best_r1,best_r2);
    
y_hat = get_y(t,m_hat,b_hat,k_hat,u,y0);

figure(4)
plot(t,y,t,y_hat)
title('y & y\_hat (r1=0.55,r2=0.56)')
xlabel('Time (seconds)')
ylabel('Distance (meters)')
legend('y','y\_hat','Location','southeast')

figure(5)
plot(t,y - y_hat)
title('Error (r1=0.55,r2=0.56)')
xlabel('Time (seconds)')
ylabel('Error (meters)')
%}
