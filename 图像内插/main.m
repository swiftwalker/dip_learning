clear
clc


%%参数调整
% mode='nearest';
% mode='bilinear';
% mode='bicubic';
nH=234;
nW=317;

%%调用
img=imread('input\lena.jpg');
tag=0;
switch mode
    case 'nearest'
        out=nearest(img,nH,nW);
        tag=1;
    case 'bilinear'
        out=bilinear(img,nH,nW);
        tag=1;
    case 'bicubic'
        out=bicubic(img,nH,nW);
        tag=1;
    otherwise
        warning('Unexpected mode. No figure created.')
end
if tag==1
    figure,imshow(img);
    figure,imshow(out);
    imwrite(out,['result\result_',mode,'.jpg']);
end
