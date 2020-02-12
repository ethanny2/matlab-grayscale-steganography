    s= imread('C:\Users\Student\Desktop\soohon-e-338-proj7\stego-project\encodedImg.bmp'); %The bmp image with the hidden stego image
    k=1;
    height= size(s,1); 
    width= size(s,2);
    %Max number of bits is 25, so 25*8 bits neeeded 200
    m= 25*8;
    % blanks(n) returns a 1-by-n array of space characters.
   % b=zeros(m);
    
   
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
   %c= char(bin2dec(reshape(b,8,[]).'))
   %disp(c);
   %fid = fopen('C:\temp\coursedata\stego_decoded.txt','wt');
   %fwrite(fid, c ,'char');
   %fclose(fid);
    
    vec = b;
    bin = [128 64 32 16 8 4 2 1];
    vec = vec(:);
    binary_martrix = reshape(vec,8,[]);
    text = char(bin * binary_martrix);
    %disp(text);    
    id = fopen('C:\Users\Student\Desktop\soohon-e-338-proj7\stego-project\decodedMessage.txt','w');
    fwrite(id,text);
    fclose(id);