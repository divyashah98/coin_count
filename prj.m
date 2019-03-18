clear all;
close all;

coin1=imread('coins.png');
bw_in=im2bw(coin1);
bw_in=imfill(bw_in,'holes');



prop=regionprops(bw_in,{'Area','Centroid'});

prop=struct2table(prop);

figure(1)
imshow(coin1)


r1=0;
r2=0;

for i=1:numel(prop.Area(:,1))
    
    if(prop.Area(i)<1900)
        coin1=insertShape(coin1,'circle',[prop.Centroid(i,1) prop.Centroid(i,2) 25],'LineWidth',5);
        coin1=insertText(coin1,[prop.Centroid(i,1)-20 prop.Centroid(i,2)-10],'1 rs');
        r1=r1+1;
    else
        coin1=insertShape(coin1,'circle',[prop.Centroid(i,1) prop.Centroid(i,2) 30],'LineWidth',5,'color','green');
        coin1=insertText(coin1,[prop.Centroid(i,1)-20 prop.Centroid(i,2)-10],'2 rs');
        r2=r2+1;
    end
end

figure(2)
imshow(coin1)

    r1
    r2
    
    total_coins=r1+r2
    