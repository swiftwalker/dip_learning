function out=nearest(in,nH,nW)


img=in;
[H,W,CH]=size(img);
out=im2uint8(zeros(nH,nW,CH));
temp=zeros(H+1,W+1,CH);
temp(2:H+1,2:W+1,1:CH)=img(1:H,1:W,1:CH);
di=H/nH;
dj=W/nW;
for j=1:nW
    for i=1:nH
        nx=round(i*di);
        ny=round(j*dj);
        for k=1:CH
            out(i,j,k)=temp(nx+1,ny+1,k);
        end
    end
end
end
