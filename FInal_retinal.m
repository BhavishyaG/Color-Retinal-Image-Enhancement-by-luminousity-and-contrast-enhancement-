
clear all;

rgbImage = imread('~/Desktop/5 - Copy.jpg'); 

r = rgbImage(:,:,1); 

g = rgbImage(:,:,2); 

b = rgbImage(:,:,3); 

hsvImage=rgb2hsv(rgbImage);

H = hsvImage(:,:,1);

S =hsvImage(:,:,2);

V = hsvImage(:,:,3);


w = (V/255).^(0.85);

V1 = w*255;
 

for i=1:size(rgbImage,1)
    
     for j=1:size(rgbImage,2)
         
         
         G(i,j) = V1(i,j)/V(i,j);
         
         r1(i,j) = G(i,j)*r(i,j);
         
         g1(i,j) = G(i,j)*g(i,j);
         
         b1(i,j) = G(i,j)*b(i,j);
     end
     
end
 
 luminousrgb = cat(3, r1, g1, b1);


 lab = rgb2lab(luminousrgb);


 L = lab(:,:,1)/100;

 L = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.01);

 lab(:,:,1) = L*100;

 F = lab2rgb(lab);

 r2 = F(:,:,1); 

 g2 = F(:,:,2); 

 b2 = F(:,:,3);


 cenhancedrgb = cat(3, r2, g2, b2);



 figure();

 subplot(1,3,1);

 imshow(rgbImage);

 subplot(1,3,2);

 imshow(luminousrgb)

 subplot(1,3,3);

 imshow(cenhancedrgb);

 figure();

 imshowpair(luminousrgb,cenhancedrgb,'montage');

 figure();

 imshowpair(rgbImage,luminousrgb,'montage');

 
 
 
 
 
 
 

 
