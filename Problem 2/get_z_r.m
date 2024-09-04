function z = get_z_r(Vr,u1,u2,lamda,t)

sysVr1 = tf([-1 0],lamda);
sysVr2 = tf([-1],lamda);
sysu1_1 = tf([1 0 0],lamda);
sysu1_2 = tf([1 0],lamda);
sysu1_3 = tf([1],lamda);
sysu2_1 = tf([1 0 0],lamda);
sysu2_2 = tf([1 0],lamda);
sysu2_3 = tf([1],lamda);

zeta1 = lsim(sysVr1,Vr,t);
zeta2 = lsim(sysVr2,Vr,t);
zeta3 = lsim(sysu1_1,u1,t);
zeta4 = lsim(sysu1_2,u1,t);
zeta5 = lsim(sysu1_3,u1,t);
zeta6 = lsim(sysu2_1,u2,t);
zeta7 = lsim(sysu2_2,u2,t);
zeta8 = lsim(sysu2_3,u2,t);

z = [zeta1 zeta2 zeta3 zeta4 zeta5 zeta6 zeta7 zeta8];
end

