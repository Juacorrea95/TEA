clear all
#crear matriz
tic
h = 20;              #altura de la nubes en metros
a = 3;               #lado de la estructura en metros
p = 3;               #altura pararayo
pres = 1;            #presicion del modelo en metros
volt = 10000;         #potencial en la nube

tam = round(h/pres);  #tamaño de la matriz, depende de presicion y altura de las nubes
tam_est = round(a/pres);    #tamaño de la estructura
pararayo = round(p/pres); 
m=zeros(tam,tam);
delta = 0.2;

#potencial 1 en la primer fila
for i=1:tam
    m(1,i)=volt;
end
#disp(m)

[p,m]=promedios(m,tam,delta,tam_est,pararayo);
err = norm(m-p);,
err_ant = err;

iter=0;
while (err<=err_ant && iter<2000) 
    err_ant = err;
    [p,m]=promedios(p,tam,delta,tam_est,pararayo);
    err = norm(m-p);
    #disp(err)
    #disp(m-p)
    iter = iter+1;
end
[FX,FY] = gradient(p);
x = rot90(FX,2);
y = rot90(FY,2);
quiver(x,y)
#disp(p)
disp(iter)
#disp(err)
toc
#plot3d(p)
