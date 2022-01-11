function out=bicubic(in,nH,nW)

img=in;
[H,W,CH]=size(img);
img=im2double(img);
temp=zeros(H+4,W+4,CH);
temp(3:H+2,3:W+2,1:CH)=img(1:H,1:W,1:CH);
out=im2double(zeros(nH,nW,CH));
di=H/nH;
dj=W/nW;

for j=1:nW
    for i=1:nH
        nx=i*di;
        ny=j*dj;
        Px=round(nx+0.5)-0.5;
        Py=round(ny+0.5)-0.5;
        dx=Px-nx;
        dy=Py-ny;
        Bw=BiCW(dx,dy);
        for k=1:CH       
            out(i,j,k)=sum(temp(Px+0.5:Px+3.5,Py+0.5:Py+3.5,k).*Bw,'all');
        end
    end
end

out=im2uint8(out);


function out=BiCW(x,y)

    out=zeros(4,4);
    a=-0.5;
    for m=1:4
        for n=1:4
            d=norm([x+m-2.5,y+n-2.5],2);
            if d<=1
                out(m,n)=(a+2)*d^3-(a+3)*d^2+1;
            elseif d>1&&d<=2
                out(m,n)=a*d^3-5*a*d^2+8*a*d-4*a;
            else
                out(m,n)=0;
            end
        end
    end
    
    

end
end
