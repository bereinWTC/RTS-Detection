%��Ե��ֵ��
path = 'ICT_Proj1_CV_intelligent_vehicles/RTSRecgonization';
name = 'RTS04';
img = imread(path + "/"+name+".jpg");
imshow(img);
I = rgb2gray(img); %ȡһ���Ҷ� ��Ϊ��ɫ����������
%edge����������canny prewitt roberts log zerocross approxcanny
BW = edge(I,'approxcanny');
figure1 = imshow(img);
figure2 = imshow(BW);

%bwperimɾ���ˣ�Ч�������
%BW = im2bw(img);
%BW2 = bwperim(BW,8);
%imshow(BW2);

%��Բ
%���������matlab�Դ���hough��Բ����
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

%����step��steptheta����ȷʶ��Ĺؼ� ����Ҳ���ù��̱�ú���
%param figure1 zerocross p=0.8 step = 0.2 steptheta = 0.003 radius[12 35]  �����·�� pֵ�ܸ� 0.98���� �����ͼҲ��0.93 ���������½� ��һ��ط� ����ط�pֵ�ر�� �ӽ�1 �����zerocrossȡֵ����ð�����µ� ���������ʹ��zerocross ���ͼ�����·����Ϊ�߽����ģ����ץ����
%param figure2 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  �ұߵ�Ȧpֵ�ܸ� �ӽ�1 ��ߵ�ֻ��0.75���� p�����˾��Ҳ��� ������һ���pֵ�ر��
%param figure3 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  û��pֵ ���ͼ��һ��Ȧ approxcanny�ܸ���
%param figure4 approxcanny p=0.8 step=0.2 steptheta = 0.003 radius[12 35]  ��Ȧp = 0.85 ��Ȧ p=1