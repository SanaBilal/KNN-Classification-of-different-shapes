I=imread('C:\Users\Salman\Desktop\new.jpg');
B_W= im2bw(I,0.5);
Label=zeros(50,1);
properties= regionprops(~B_W,'Area','Eccentricity','ConvexArea','Extent','FilledArea','Orientation', 'Perimeter' ,'Solidity');
B=zeros(50,8);
for i=1:1:50;
   B(i,1)=properties(i).Area;
   B(i,2)=properties(i).Eccentricity;
   B(i,3)=properties(i).ConvexArea;
   B(i,4)=properties(i).Extent;
   B(i,5)=properties(i).FilledArea;
   B(i,6)=properties(i).Orientation;
   B(i,7)=properties(i).Perimeter;
   B(i,8)=properties(i).Solidity;
   Label(i,1)=2;
end
  
P=imread('C:\Users\Salman\Desktop\newsquare.jpg');
B_W1= im2bw(P,0.5);
Label1=zeros(50,1);
properties1= regionprops(~B_W1,'Area','Eccentricity','ConvexArea','Extent','FilledArea','Orientation', 'Perimeter' ,'Solidity');
C=zeros(50,8);
for i=1:1:50;
   C(i,1)=properties1(i).Area;
   C(i,2)=properties1(i).Eccentricity;
   C(i,3)=properties1(i).ConvexArea;
   C(i,4)=properties1(i).Extent;
   C(i,5)=properties1(i).FilledArea;
   C(i,6)=properties1(i).Orientation;
   C(i,7)=properties1(i).Perimeter;
   C(i,8)=properties1(i).Solidity;
   Label1(i,1)=3;
end
        
train=zeros(100,8);
for i=1:1:100;
    for j=1:1:8
        if i<=50
    train(i,j)=B(i,j);
        end
        if i>50
            train(i,j)=C(i-50,j);
        end
    end
end

response=zeros(100,1);

for i=1:1:100
    if i<=50
    response(i,1)=Label(i,1);
    end
    if i>50
        response(i,1)=Label1(i-50,1);
    end
end

R=imread('C:\Users\Salman\Desktop\test1.jpg');
B_W2= im2bw(R,0.5);
properties2= regionprops(~B_W2,'Area','Eccentricity','ConvexArea','Extent','FilledArea','Orientation', 'Perimeter' ,'Solidity');
recognize=zeros(10,8);


for i=1:1:10;
   recognize(i,1)=properties2(i).Area;
   recognize(i,2)=properties2(i).Eccentricity;
   recognize(i,3)=properties2(i).ConvexArea;   
   recognize(i,4)=properties2(i).Extent;
   recognize(i,5)=properties2(i).FilledArea;
   recognize(i,6)=properties2(i).Orientation;
   recognize(i,7)=properties2(i).Perimeter;
   recognize(i,8)=properties2(i).Solidity;
end


mdl = ClassificationKNN.fit(train,response);
for i = 1:1:10
labels = predict(mdl,recognize(i,:));
end




mdl = ClassificationKNN.fit(train,response);
for i = 1:1:10
labels = predict(mdl,recognize(i,:));
end
