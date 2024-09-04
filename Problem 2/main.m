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

%Λ(s) parameter

r = 113;
lamda = [1 2*r r^2];


%Zeta matrix

zc = get_z_c(Vc,u1(t)',u2,lamda,t);
zr = get_z_r(Vr,u1(t)',u2,lamda,t);

%Least square methor

thetac = mrdivide(Vc' * zc, zc' * zc)';
thetar = mrdivide(Vr' * zr, zr' * zr)';

%Get Vr_hat & Vc_hat

[Vr_hat,Vc_hat] = get_v_hat(u1(t)',u2,t,thetar,thetac,r,r);

%Plot Voltages and Errors

tiles = tiledlayout(2,2);

nexttile
plot(t,Vr_hat)
title("V_R\_hat for double pole @-" + r)
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
er = mean(abs(Vr-Vr_hat));
plot(t,Vr-Vr_hat)
title({"Error of V_R estimation for double pole @-" + r,"Mean Absolute Error = " + er})
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
plot(t,Vc_hat)
title("V_C\_hat for double pole @-" + r)
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
ec = mean(abs(Vc-Vc_hat));
plot(t,Vc-Vc_hat)
title({"Error of V_C estimation for double pole @-" + r,"Mean Absolute Error = " + ec})
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

%{
%Let's add some noise

Vr(1500) = 10^4;
Vr(1.2*10^3) = 10^6;
Vr(4*10^5) = 10^5;

Vc(5*10^4) = 10^3;
Vc(1.2*10^5) = 7*10^5;
Vc(7*10^5) = 8*10^4;

zc = get_z_c(Vc,u1(t)',u2,lamda,t);
zr = get_z_r(Vr,u1(t)',u2,lamda,t);

thetac = mrdivide(Vc' * zc, zc' * zc)';
thetar = mrdivide(Vr' * zr, zr' * zr)';

[Vr_hat,Vc_hat] = get_v_hat(u1(t)',u2,t,thetar,thetac,r,r);

tiles2 = tiledlayout(2,2);

nexttile
plot(t,Vr_hat)
title("V_R\_hat for double pole @-" + r)
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
er = mean(abs(Vr-Vr_hat));
plot(t,Vr-Vr_hat)
title({"Error of V_R estimation for double pole @-" + r,"Mean Absolute Error = " + er})
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
plot(t,Vc_hat)
title("V_C\_hat for double pole @-" + r)
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

nexttile
ec = mean(abs(Vc-Vc_hat));
plot(t,Vc-Vc_hat)
title({"Error of V_C estimation for double pole @-" + r,"Mean Absolute Error = " + ec})
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")

[Vr_hat,Vc_hat] = get_v_hat(u1(t)',u2,t,thetar,thetac,r,r);
%}
