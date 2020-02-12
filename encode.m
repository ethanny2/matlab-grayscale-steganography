
    c = imread('C:\Users\Student\Desktop\soohon-e-338-proj7\stego-project\earth.bmp');  %The path for the grayscale bmp cover image
    id = fopen('C:\Users\Student\Desktop\soohon-e-338-proj7\stego-project\secret_message.txt', 'r');
    spec = '%c';
    message = fscanf(id,spec);
%   disp(message); %testing if the string was actually retrived

    %testing if bmp image is color or greyscale
    %isColor = ndims(c);
    %testMe = size(c,3);
   
    m = length(message) * 8;
    %message2= strtrim(message2);
    %disp(message2);
   
   ascii = uint8(message); %Message in Ascii int form
  %  disp(ascii);
    binary = transpose(dec2bin(ascii,8));
    %disp(binary);
    binary = binary(:);
    LSB=0;
   num = length(binary);
   b = zeros(num,1); %b is a vector of bits
   
    
    for k = 1:num
        if(binary(k) == '1')
            %disp(binary(k));
            b(k) = 1;
        else
            b(k) = 0;
        end
    end
 
  %  disp(b);

  %  casted = uint8(message2);
    
 %   string_arr  = int2bin(casted,25);
   % disp(string_arr); %second param is length?
    
    
    s = c;
    height = size(c,1);
    width = size(c,2);
   
 
    k = 1;
    for i = 1 : height
        %    if(k>25)
	       %         break;
	        % end;
        for j = 1 : width
         
             LSB = mod(double(c(i,j)), 2);
            if (k>m || LSB == b(k))
                s(i,j) = c(i,j);
            else
               s(i,j)=c(i,j)+b(k) -LSB;
            end
            k = k + 1;
             
        end
    end
      
    
    
    
    
    
     %Write image
   % imwrite(s, 'C:\temp\coursedata\stego.bmp');
     disp('Done encoding message');
    imwrite(s,'C:\Users\Student\Desktop\soohon-e-338-proj7\stego-project\encodedImg.bmp','bmp'); %write the new image with the hidden image in it to 's' or disk.


    
   