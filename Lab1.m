%MVE136 LABORATION 1: RANDOM SIGNAL ANALYSIS

%%
%2.1 - Histogram
N=2000;
x=randn([1 N]);
u=rand([1 N]);

figure()
subplot(2,1,1)
hist(x,10000)
title('x')
subplot(2,1,2)
hist(u,10000)
title('u')

%%
%2.2 - Joint Distribution

x = randn([1 N]);
y = randn([1 N]);

figure()
plot(x,y,'.') %equiprobability lines: either a circle or diagonals?

a=sqrt(3);
u = a*rand([1 N])
v = a*rand([1 N])

figure()
plot(u,v,'.')
%Greater variance and deviance.

figure()
plot(u,x,'.') 
%Values are spread accordingly to eacch distribution, making a fusion.

%%
%2.3 Conditional Distribution

x = randn([1 N]);
y = randn([1 N]);
dy = 0.1;
yh=0.5;
i=0;
X=[];
Y=[];

figure()
for k=1:2000
    if y(k)>yh-dy && y(k)<yh+dy
        %plot(x(k),y(k),'.')
        i=i+1;
        %hold on
        X(i)=x(k); 
        Y(i)=y(k);
    end
end
subplot(1,2,1)
plot(Y,X,'.')
subplot(1,2,2)
hist(X,10000)
title('Y/X')


a=sqrt(3);
u = a*rand([1 N])
v = a*rand([1 N])
du = 0.1;
uh=0.5;
i=0;
U=[];
V=[];

figure()
for k=1:2000
    if u(k)>uh-du && u(k)<uh+du
        %plot(x(k),y(k),'.')
        i=i+1;
        %hold on
        U(i)=u(k); 
        V(i)=v(k);
    end
end
subplot(1,2,1)
plot(U,V,'.')
subplot(1,2,2)
hist(V,10000)
title('U/V')
%The plot shows the spread of values within the restricted area and
%the hist shows the numbers of occurencies for the values of X within the
%range of Y

%%

%3.1 - Joint Distribution and Correlation

