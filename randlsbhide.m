function [ste_cover,len_total] = randlsbhide(input,file,output,key)
cover = imread(input);
ste_cover = cover;
ste_cover = double(ste_cover);
f_id = fopen(file,'r');
[msg,len_total] = fread(f_id,'ubit1');
[m,n] = size(ste_cover);
if len_total > m*n
    error('��Ϣ�����������ͼ��');
end
p = 1;
[row,col] = randinterval(ste_cover,len_total,key);
for i = 1:len_total
    ste_cover(row(i),col(i),1) = ste_cover(row(i),col(i),1)-mod(ste_cover(row(i),col(i),1),2) + msg(p,1);
    if p == len_total
        break;
    end
    p = p+1;
end
ste_cover = uint8(ste_cover);
imwrite(ste_cover,output);

subplot(121),imshow(cover);title('ԭʼͼ��');
subplot(122),imshow(output);title('������Ϣ��ͼ��');