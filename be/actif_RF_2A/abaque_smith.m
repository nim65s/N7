function abaque_smith
%Construction de l'abaque de smith
 close all
 hold on;

pas=100;

h0=title ('ABAQUE DE SMITH');
set(h0,'FontSize',[10],'FontWeight','bold');
set(1,'position',[200 150 550 500],'Color',[.7 .78 1])
h1=get(1,'CurrentAxes');
set(h1,'XTick',[]);
set(h1,'YTick',[]);
Fn=1.2;axis ([-Fn Fn -Fn Fn]);

% tracé de l'abaque
% cercles à r constant
Teta=(-pi:pi/pas:pi);
S=tan(Teta/2);
R=[0,.2,.5,1,2,5];n=size(R,2);
for i=1:n
   r=R(i);
   D=S.*S+(r+1)^2;
   X=(S.*S+(r^2-1))./D;
   Y=2*(S./D);
   if (r==0) + (r==1)
     h2=plot(X,Y);
     set(h2,'Color',[0 0 0],'lineWidth',[1])
   else
      h3=plot(X,Y);
     set(h3,'Color',[.5 .5 .5],'lineWidth',[0.5],'LineStyle',':')
   end
end
% quart de cercles à S constant
Teta=(pi:-pi/pas:0);
S=[5,2,1,0.5,0.1,0,-0.1,-0.5,-1,-2,-5];n=size(S,2);
for i=1:n
   s=S(i);
   R=tan(Teta/2);
   D=(R+1).*(R+1)+s*s;
   X=((R.*R-1)+s*s)./D;
   Y=2*s./D;
   if s==0
       h4=plot(X,Y);
       set(h4,'Color',[0 0 0],'lineWidth',[1])
   else
       h5=plot(X,Y);
       set(h5,'Color',[.5 .5 .5],'lineWidth',[0.5],'LineStyle',':')
   end
end
