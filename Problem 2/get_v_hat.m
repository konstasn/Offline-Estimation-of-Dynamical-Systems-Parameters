function [Vr,Vc] = get_v_hat(u1,u2,t,thetar,thetac,r1,r2)

thetac(1) = thetac(1) + 2*r1;
thetac(2) = thetac(2) + r1^2;

thetar(1) = thetar(1) + 2*r2;
thetar(2) = thetar(2) + r2^2;

RC = (thetac(1) + thetar(1))/2; % RC is actually 1/RC
LC = (thetac(2) + thetar(2))/2; % likewise
hc_1 = tf([RC 0],[1 RC LC]);
hc_2 = tf([RC LC],[1 RC LC]);
hr_1 = tf([1 0 LC],[1 RC LC]);
hr_2 = tf([1 0 0],[1 RC LC]);

H = [hr_1 hr_2 ; hc_1 hc_2];

u = [u1 u2];

V = lsim(H,u,t);

Vr = V(:,1);
Vc = V(:,2);
end

