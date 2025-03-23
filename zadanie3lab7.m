load hospital.mat;
chlopaki=hospital(hospital.Sex =="Male",:);
dziewczyny= hospital(hospital.Sex == "Female",:);

Xc=sort(chlopaki.Weight);
xmc=mean(Xc);
fic=std(Xc);
Xd=sort(dziewczyny.Weight);
xmd=mean(Xd);
fid=std(Xd);
gaussc=(1/(fic*sqrt(2*pi)))*exp(-0.5*((Xc-xmc).^2/fic^2));
gaussd=(1/(fid*sqrt(2*pi)))*exp(-0.5*((Xd-xmd).^2/fid^2));

figure 
subplot(1,2,1)
plot(Xc,gaussc,'r')
xlabel('wiek')
ylabel('waga')
title('rozklad gaussa mezczyzni')
hold on
histogram(Xc,'Normalization','pdf')
subplot(1,2,2)
plot(Xd,gaussd,'r')
xlabel('wiek')
ylabel('waga')
title('rozklad gaussa kobiety')
hold on
histogram(Xd,'Normalization','pdf')