function zeta = get_z(y,u,t,lamda)
sysy1 = tf([-1 0],lamda);
sysy2 = tf([-1],lamda);
sysu = tf([1],lamda);

zeta1 = lsim(sysy1,y,t);
zeta2 = lsim(sysy2,y,t);
zeta3 = lsim(sysu,u(t),t);

zeta = [zeta1 zeta2 zeta3];
end

