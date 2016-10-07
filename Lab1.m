%MVE136 LABORATION 1: RANDOM SIGNAL ANALYSIS

%%
%2.1 - Histogram
N=2000;
x=randn([1 N]);
u=rand([1 N]);

figure()
subplot(2,1,1)
hist(x,100)
title('x')
subplot(2,1,2)
hist(u,100)
title('u')

%%
%2.2 - Joint Distribution

x = randn([1 N]);
y = randn([1 N]);

figure()
subplot(1,2,1)
plot(x,y) %equiprobability lines: either a circle or diagonals?
title('Normal distribution')
xlabel('X')
ylabel('Y')

a=sqrt(3);
u = a*rand([1 N])
v = a*rand([1 N])
subplot(1,2,2)
plot(u,v)
title('Uniform distribution')
xlabel('U')
ylabel('V')
%Greater variance and deviance.

figure()
plot(u,x,'.') 
title('Mixed')
xlabel('u')
ylabel('x')
%Values are spread accordingly to each distribution, making a fusion. The
%U-dist shows a more uniformal distribution, as expected, as the normal
%distribution tends to assign more of the mid values, as  expected. The
%fusion of the two distributions shows a variety of values (N) in a uniform
%intervall.

%%
%2.3 Conditional Distribution

N=2000;
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
        i=i+1;
        X(i)=x(k); 
        Y(i)=y(k);
    end
end
subplot(1,2,1)
plot(X,Y,'.')
subplot(1,2,2)
hist(X,100)
title('Gaussian')
xlabel('X')
ylabel('Y')


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
hist(V,100)
title('Uniform')
xlabel('U')
ylabel('V')
%The plot shows the spread of values within the restricted area and
%the hist shows the numbers of occurencies for the values of X within the
%range of Y

%%

%3.1 - Joint Distribution and Correlation

N=2000;
x=randn([1 N]);
u=rand([1 N]);

z=@(a) x.*a+sqrt(1-a.^2).*y;

zv = zeros(4,N);
zv(1,:) = z(0.5);
zv(2,:) = z(-0.5);
zv(3,:) = z(0.9);
zv(4,:) = z(-0.9);

alpha=([0.5 -0.5 0.9 -0.9])
    figure()
for i=1:4
    subplot(2,2,i)
    plot(x,zv(i,:),'.')
    title(alpha(i))
    xlabel('X')
    ylabel('Z')
end

figure()
hist(zv(1,:),100) %Increase bins for finer gaussian.
title('')
xlabel('')
ylabel('')

%%
%3.2 - Conditional Distribution.

N=2000;
x=randn([1 N]);
u=rand([1 N]);

z=@(a) x.*a+sqrt(1-a.^2).*y;
zv = z(0.7);


dz = 0.1
zh = ([0.5 -0.5]);
i=[1 1];
X1=[];
Z1=[];
for k=1:2000
    for l=1:2
        if zv(k)>zh(l)-dz && zv(k)<zh(l)+dz
            %plot(x(k),y(k),'.')
            
            %hold on
            X1(l,i)=x(k); 
            Z1(l,i)=zv(k);
            i(l)=i(l)+1;
        end
    end
end
figure()
subplot(1,2,1)
hist(X1(1,:),100)
title('X/Z - alpha = 0.7, z=0.5')
subplot(1,2,2)
hist(X1(2,:),100)
title('X/Z - alpha = 0.7, z=-0.5')


zv = z(-0.7);

dz = 0.1;
zh = ([0.5 -0.5]);
i=([1 1]);
X2=[];
Z2=[];
for k=1:2000
    for l=1:2
        if zv(k)>zh(l)-dz && zv(k)<zh(l)+dz
            %plot(x(k),y(k),'.')
            
            %hold on
            X2(l,i)=x(k); 
            Z2(l,i)=zv(k);
            i(l)=i(l)+1;
        end
    end
end
figure
subplot(1,2,1)
hist(X2(1,:),100)
title('X/Z - alpha = -0.7, z=0.5')
subplot(1,2,2)
hist(X2(2,:),100)
title('X/Z - alpha = -0.7, z=-0.5')

%%
%4.1 Ensemble and Time Averages

N=256; 
K=N;

X=randn(N,K);
EA = mean(X');
TA = mean(X);
figure()
plot(EA)
hold on
plot(TA)
diff = mean(EA)-mean(TA)
legend('Ensemble Average','Time Average')

%The averages do not hold the same values on each sample, however the main
%value of both EA and TA hold s the same average value.

%%
%4.2 - Joint Dstribution and Correlation.

N=256; 
K=N;

X=randn(N,K);
subplot(2,2,1)
plot(X(1,:),X(2,:),'.')
title('n1=1, n2=2')
subplot(2,2,2)
plot(X(10,:),X(20,:),'.')
title('n1=10 , n2=20')
subplot(2,2,3)
plot(X(5,:),X(6,:),'.')
title('n1=5 , n2=6')
subplot(2,2,4)
plot(X(70,:),X(140,:),'.')
title('n1=70 , n2=140')
sum=([0 0 0 0]);

    for k=1:256
        r(k)=X(1,k).*X(2,k);
        sum=sum+r(k);
    end
    

r=1/K*sum;

result = r - mean(X(1))*mean(X(2)) %Uncorrelated if covariance: E(XY)-E(X)*E(Y)=0
% Result is not zero, but close to zero, which proves that the sets are
% uncorrelated.

%%
%5.4 - Joint Distribution

N=256;
K=N;

W=randn(N,K);
x=filter(1,[1 -1],W)

figure()
plot(x)
xlabel('n')
ylabel('X(n)')
figure()
subplot(2,2,1)
plot(x(10,:),x(9,:),'.')
title('n1=10, n2=9')
subplot(2,2,2)
plot(x(50,:),x(49,:),'.')
title('n1=50, n2=49')
subplot(2,2,3)
plot(x(100,:),x(99,:),'.')
title('n1=100, n2=99')
subplot(2,2,4)
plot(x(200,:),x(199,:),'.')
title('n1=200, n2=199')

figure()
subplot(2,2,1)
plot(x(50,:),x(40,:),'.')
title('n1=50, n2=40')
subplot(2,2,2)
plot(x(100,:),x(90,:),'.')
title('n1=100, n2=90')
subplot(2,2,3)
plot(x(200,:),x(190,:),'.')
title('n1=200, n2=190')
subplot(2,2,4)
plot(x(200,:),x(190,:),'.')
        
%%
%5.5 - Sample Auto-correlation

W=randn(N,K);
x=filter(1,[1 -1],W)
sum=0;
for n=2:256
    r(n-1)=x(n,:)*x(n-1,:)'/K;
    result2(n)=n-1;
    result(n)=r(n-1);
end

figure()
for n=2:256
    subplot(1,2,1)
    plot(result(n),result(n-1),'.')
    title('Practical')
    hold on
    subplot(1,2,2)
    plot(result2(n),result2(n-1),'.')
    title('Theoretical')
    hold on
end

%Check K=1 auto-correlation
sum=0;
for n=2:256
        r=x(n,1).*x(n-1,1);
        sum=sum+r;
    result(n)=sum;
end
result = 1/K * result;

figure()
for n=2:256
    plot(result(n),result(n-1),'.')
    hold on
end
%One realization is possible.

%%
%6.3 - Joint Distribution.

N=256;
K=N;

W=randn(N,K);
x=filter(1,[1 -0.9],W)

figure()
plot(x)
figure()
subplot(2,2,1)
plot(x(10,:),x(9,:),'.')
title('n1=10, n2=9')
subplot(2,2,2)
plot(x(50,:),x(49,:),'.')
title('n1=50, n2=49')
subplot(2,2,3)
plot(x(100,:),x(99,:),'.')
title('n1=100, n2=99')
subplot(2,2,4)
plot(x(200,:),x(199,:),'.')
title('n1=200, n2=199')

figure()
subplot(2,2,1)
plot(x(50,:),x(40,:),'.')
title('n1=50, n2=40')
subplot(2,2,2)
plot(x(100,:),x(90,:),'.')
title('n1=100, n2=90')
subplot(2,2,3)
plot(x(200,:),x(190,:),'.')
title('n1=200, n2=190')
subplot(2,2,4)
plot(x(200,:),x(190,:),'.')

%In the 5.4 task the point with dn=10 apart did give a fair correlation,
%however in this case with -0.9 instead of -1, n far apart gives a very bad
%, if none, correlation and the n's need to be closer to each other.

%%
%6.4 - Sample Auto-correlation

W=randn(N,K);
x=filter(1,[1 -0.9],W)
sum=0;

for n=2:256
    r(n-1)=x(n,:)*x(n-1,:)'/K;
    result2(n) = (1-0.81^n)/(1-0.81)
    result(n)=r(n-1);
end

figure()
for n=2:256
    plot(result)
    hold on
    plot(result2)
    hold on
end
title('Practical vs Theoretical')
legend('Practical','Theoretical')

%One realizaion
% sum=0;
% for n=2:256
%     for k=1:1
%         r=x(n,k).*x(n-1,k);
%         sum=sum+r;
%     end
%     %result2(n) = mean(x(n)*x(n-1));
%     result(n)=sum;
% end
% result = 1/K * result;
% 
% figure()
% for n=2:256
%     plot(result(n),result(n-1),'.')
%     hold on
% end