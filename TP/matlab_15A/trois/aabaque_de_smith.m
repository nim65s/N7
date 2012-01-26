hold on
axis 'equal'
axis([-1 1 -1 1])

% Tracé des familles de courbes pour r constant
u=-1:0.005:1;
rc=[0:0.02:0.2 0.2:0.05:0.5 0.5:0.1:1 1:0.2:2 ...
    2:0.5:5 5:2:10 10:5:20 20:20:50];
for r=rc
    v=sqrt(1./(1+r).^2-(u-r./(1+r)).^2);
    plot(u,real(v))
    plot(u,real(-v))
end

% Tracé des familles de courbes pour x constant
xc=logspace(-1,2,25);
vc=logspace(-2,0,500);
for x=xc
    for v=vc
        u=1-sqrt(1./x.^2-(v-1./x).^2);
        if u.^2+v.^2 <=1
            plot(real(u),v)
            plot(real(u),-v)
        end
    end    
end

[su sv] = solve((u-2/3).^2+v.^2-1/9,(u-1).^2+(v+1).^2-1);