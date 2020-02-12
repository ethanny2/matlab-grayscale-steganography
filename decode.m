s= imread('[YOUR_PATH_HERE]\encodedImg.bmp');
k=1;
height= size(s,1); 
width= size(s,2);
%Max number of bits is 25, so 25*8 bits neeeded 200
m= 25*8;   
%Loop in all pixels and get lsb.     
for i=1:height
    for j=1:width
        if k<=m
            b(k)=mod(double(s(i,j)),2);
            k=k+1;
        end
    end
end
%b is the extracted secret message as a bit string
%print to the terminal screen    
%Now next we will convert from binary to a string that humans can see    
vec = b;
bin = [128 64 32 16 8 4 2 1];
vec = vec(:);
binary_martrix = reshape(vec,8,[]);
text = char(bin * binary_martrix);   
id = fopen('[YOUR_PATH_HERE]\decodedMessage.txt','w');
fwrite(id,text);
fclose(id);