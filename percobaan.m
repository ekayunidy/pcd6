I = imread("pcd6.jpg");
imshow(I);
%syntax mencari rata2 RGB
R = I (:,:,1);
G = I (:,:,2);
B = I (:,:,3);
abu2 = (R+G+B)/3; 
imshow(abu2);

%syntax transformasi logaritmik 
G1 = 0.2*log(abu2+1);
imshow(G1);
G2 = 0.3*log(abu2+1);
imshow(G2);
G3 = 0.1*log(abu2+1);
imshow(G3);

%syntax mencari histogram 
hist(G1);
hist(G2);
hist(G3);

%syntax keabuan 
abu2_a = abu2+80;
imshow(abu2_a);
abu2_b = abu2-80;
imshow(abu2_b);

%syntax filtering sobel A
abu2_a = double(abu2_a);
tinggi = size(abu2_a, 1);
lebar = size(abu2_a, 2);
rgb = size(abu2_a, 3);
abu2_a_output = zeros(size(abu2_a));
gx = [1 2 1; 0 0 0; -1 -2 -1];
gy = [1 0 -1; 2 0 -2; 1 0 -1];
for i = 2 : tinggi - 1
   for j = 2 : lebar - 1
       for k = 1 : rgb
           temp_abu2_a = abu2_a(i - 1 : i + 1, j - 1 : j + 1, k);
           x = sum(sum(gx .* temp_abu2_a)); 
           y = sum(sum(gy .* temp_abu2_a));
           g = sqrt(x^2 + y^2);
           abu2_a_output(i, j, k) = g;
        end
    end
end
%syntax uint8 berfungsi untuk mengubah double ke int
abu2_a_output = uint8(abu2_a_output);
imshow(abu2_a_output);

%syntax filtering sobel B
abu2_b = double(abu2_b);
tinggi = size(abu2_b, 1);
lebar = size(abu2_b, 2);
rgb = size(abu2_b, 3);
abu2_b_output = zeros(size(abu2_b));
gx = [1 2 1; 0 0 0; -1 -2 -1];
gy = [1 0 -1; 2 0 -2; 1 0 -1];
for i = 2 : tinggi - 1
   for j = 2 : lebar - 1
       for k = 1 : rgb
           temp_abu2_b = abu2_b(i - 1 : i + 1, j - 1 : j + 1, k);
           x = sum(sum(gx .* temp_abu2_b)); 
           y = sum(sum(gy .* temp_abu2_b));
           g = sqrt(x^2 + y^2);
           abu2_b_output(i, j, k) = g;
        end
    end
end
%syntax uint8 berfungsi untuk mengubah double ke int
abu2_b_output = uint8(abu2_b_output);
imshow(abu2_b_output);


           