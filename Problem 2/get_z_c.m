function z = get_z_c(Vc,u1,u2,lamda,t)

sysVc1 = tf([-1 0],lamda);
sysVc2 = tf([-1],lamda);
sysu1_1 = tf([1 0],lamda);
sysu1_2 = tf([1],lamda);
sysu2_1 = tf([1 0],lamda);
sysu2_2 = tf([1],lamda);

zeta1 = lsim(sysVc1,Vc,t);
zeta2 = lsim(sysVc2,Vc,t);
zeta3 = lsim(sysu1_1,u1,t);
zeta4 = lsim(sysu1_2,u1,t);
zeta5 = lsim(sysu2_1,u2,t);
zeta6 = lsim(sysu2_2,u2,t);

z = [zeta1 zeta2 zeta3 zeta4 zeta5 zeta6];
end

