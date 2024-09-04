%Clear output and memory

clc
clear

%Initialize tspan

t = [0:10^(-6):5];

%Get Vr & Vc values, initialize source voltages

[Vr,Vc]=v(t);
Vr = Vr';
Vc = Vc';

u1 = @(t) 3*sin(2*t);
u2 = 2*ones(size(t'));

%For loop

best_er = 1000;
best_ec = 1000;
Er = [];
Ec = [];

for i = 1:20:1000
    
    r = i;
    lamda = [1 2*r r^2];
    
    zc = get_z_c(Vc,u1(t)',u2,lamda,t);
    zr = get_z_r(Vr,u1(t)',u2,lamda,t);
    
    thetac = mrdivide(Vc' * zc, zc' * zc)';
    thetar = mrdivide(Vr' * zr, zr' * zr)';

    [Vr_hat,Vc_hat] = get_v_hat(u1(t)',u2,t,thetar,thetac,r,r);
    
    er = mean(abs(Vr-Vr_hat));
    Er = [Er er];
    ec = mean(abs(Vc-Vc_hat));
    Ec = [Ec ec];
    
    if er < best_er
        best_er = er;
        best_rr = r;
    end 
      
    if er < best_ec
        best_ec = ec;
        best_rc = r;
    end
    i
end