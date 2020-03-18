%边缘二值化
path = 'ICT_Proj1_CV_intelligent_vehicles/RTSRecgonization';
name = 'RTS04';
img = imread(path + "/"+name+".jpg");
imshow(img);
I = rgb2gray(img); %取一个灰度 因为彩色参数不能用
%edge函数参数：canny prewitt roberts log zerocross approxcanny
BW = edge(I,'approxcanny');
figure1 = imshow(img);
figure2 = imshow(BW);

%bwperim删掉了，效果不算好
%BW = im2bw(img);
%BW2 = bwperim(BW,8);
%imshow(BW2);

%找圆
%以下这段是matlab自带的hough找圆函数
%[centers, radii, metric] = imfindcircles(BW,[10 200]);
%centersStrong5 = centers; 
%radiiStrong5 = radii;
%metricStrong5 = metric;
%viscircles(centers, radii,'EdgeColor','b');
step = 0.1;
steptheta = 0.03;
radius = [12.5 35];
plimit = 0.90;


[hough_space,hough_circle,para,AW] = findcircle(BW,0.5,0.003,12,35,0.85,img);
imwrite(AW,path + "/" + name + "_dect.jpg");
%centers = para(:,1:2);
%radius = para(:,3);
%viscircles(centers,radii,'EdgeColor','b');

%调低step和steptheta是正确识别的关键 但是也会让过程变得很慢
%param figure1 zerocross p=0.8 step = 0.2 steptheta = 0.003 radius[12 35]  上面的路标 p值很高 0.98左右 下面的图也有0.93 但是在右下角 有一坨地方 这个地方p值特别高 接近1 这个是zerocross取值过于冒进导致的 但是如果不使用zerocross 这个图下面的路标因为边界过于模糊会抓不到
%param figure2 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  右边的圈p值很高 接近1 左边的只有0.75左右 p给高了就找不到 左下那一坨的p值特别高
%param figure3 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  没看p值 这个图就一个圈 approxcanny很给力
%param figure4 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  外圈p = 0.85 内圈 p=1