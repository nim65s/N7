dim=49;
tau = 200;
mu = 6.1e-4;
c=sqrt(tau/mu)  ;
% matrice 1D u''(x)=f
A=2*eye(dim);
for i=1:dim-1
    A(i,i+1)=-1;
    A(i+1,i)=-1;
end
L=0.5  ;
h=L/(dim+1);
x=L*(1:dim)/(dim+1);
Ad=-A/h^2;

% schema en temps 
figure(3)
alpha=0.1;
u0=0*x';
dt=1e-5;
%u1=dt*alpha*(L-x.')+u0;
n=10;
v0=1e-5;
u1=pi*n*c/L*v0*sin(pi*n*x.'/L)*dt;
tf=0;
um=u1(floor(dim/2));
gamma = 500.4;
for i=1:1000  
    figure(3)
    %u2=2*u1-u0+(c*dt)^2*Ad*u1;
    u2=2*u1-u0+(c*dt)^2*Ad*u1-gamma*(u1-u0)*dt;
    t=i*dt;
    tf=[tf t];
    um=[um u1(floor(dim/2))];
    subplot(2,1,1)
    title('evolution en temps')
    plot(tf,um,'-');
    ue=1/(pi^2)*sin(pi*x)*cos(pi*t);
    axis([0 1000*dt -0.00001 0.00001]);
    subplot(2,1,2)
    title('evolution en espace')
    plot(x,u2,'-')%,x,ue,'-.');
    axis([0 0.5 -0.00001 0.00001]);
    u0=u1;
    u1=u2;
end



