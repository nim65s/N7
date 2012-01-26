f = inline('x.*(1-y)','x','y');
h = 0.1;
x = 0:h:3;
yeul = 0;
yeurk2 = 0;
yeurk4 = 0;
for i = x(1:end-1)
yeul   = [ yeul   eul(f,i,  yeul(end),h) ];
yeurk2 = [ yeurk2   RK2(f,i,yeurk2(end),h) ];
yeurk4 = [ yeurk4   RK4(f,i,yeurk4(end),h) ];
end;
yex=1-exp(-x.^2./2);

subplot(2,2,1)
plot(x,yeul,'-ro',x,yeurk2,'-xg',x,yeurk4,'-.b',x,yex,'-k')
title('y+xy=x')
h = legend('Euler','Runge-Kutta 2','Runge-Kutta 4','Solution exacte',4);
set(h,'Interpreter','none')

f = inline('(3-2*x*(y^4))','x','y');
h = 0.1;
x = 0:h:1;
yeul = 1;
yeurk2 = 1;
yeurk4 = 1;
for i = x(1:end-1)
yeul   = [ yeul   eul(f,i,  yeul(end),h) ];
yeurk2 = [ yeurk2   RK2(f,i,yeurk2(end),h) ];
yeurk4 = [ yeurk4   RK4(f,i,yeurk4(end),h) ];
end;
[x,yex] = ode45(f,x,1);

subplot(2,2,2)
plot(x,yeul,'-ro',x,yeurk2,'-xg',x,yeurk4,'-.b',x,yex,'-k')
title('y+2xy^4=3, pas de 0.1')
h = legend('Euler','Runge-Kutta 2','Runge-Kutta 4','Solution exacte',4);
set(h,'Interpreter','none')

f = inline('(3-2*x*(y^4))','x','y');
h = 0.07;
x = 0:h:1;
yeul = 1;
yeurk2 = 1;
yeurk4 = 1;
for i = x(1:end-1)
yeul   = [ yeul   eul(f,i,  yeul(end),h) ];
yeurk2 = [ yeurk2   RK2(f,i,yeurk2(end),h) ];
yeurk4 = [ yeurk4   RK4(f,i,yeurk4(end),h) ];
end;
[x,yex] = ode45(f,x,1);

subplot(2,2,3)
plot(x,yeul,'-ro',x,yeurk2,'-xg',x,yeurk4,'-.b',x,yex,'-k')
title('y+2xy^4=3, pas de 0.07')
h = legend('Euler','Runge-Kutta 2','Runge-Kutta 4','Solution exacte',4);
set(h,'Interpreter','none')

f = inline('(3-2*x*(y^4))','x','y');
h = 0.04;
x = 0:h:1;
yeul = 1;
yeurk2 = 1;
yeurk4 = 1;
for i = x(1:end-1)
yeul   = [ yeul   eul(f,i,  yeul(end),h) ];
yeurk2 = [ yeurk2   RK2(f,i,yeurk2(end),h) ];
yeurk4 = [ yeurk4   RK4(f,i,yeurk4(end),h) ];
end;
[x,yex] = ode45(f,x,1);

subplot(2,2,4)
plot(x,yeul,'-ro',x,yeurk2,'-xg',x,yeurk4,'-.b',x,yex,'-k')
title('y+2xy^4=3, pas de 0.04')
h = legend('Euler','Runge-Kutta 2','Runge-Kutta 4','Solution exacte',4);
set(h,'Interpreter','none')
