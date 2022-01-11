function out=bilinear(in,nH,nW)
img=in;
[H,W,CH]=size(img);
img=im2double(img);
temp=zeros(H+2,W+2,CH);
temp(2:H+1,2:W+1,1:CH)=img(1:H,1:W,1:CH);

out=im2double(zeros(nH,nW,CH));
di=H/nH;
dj=W/nW;
for j=1:nW
    for i=1:nH
        nx=i*di;
        ny=j*dj;
        W=floor(nx);
        S=ceil(nx);
        A=floor(ny);
        D=ceil(ny);
        dx=nx-W;
        dy=ny-A;
        for k=1:CH
            out(i,j,k)=(1-dx)*(1-dy)*temp(W+1,A+1,k)+dx*dy*temp(S+1,D+1,k)+dx*(1-dy)*temp(W+1,D+1,k)+(1-dx)*dy*temp(S+1,A+1,k);
        end
    end
end

out=im2uint8(out);

end