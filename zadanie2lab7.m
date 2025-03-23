load hospital.mat;


X=sort(hospital.Weight); %sortuje nam x ładnie 
xm=mean(X); %sredni x 
fi=std(X);


gauss=(1/(fi*sqrt(2*pi)))*exp(-0.5*((X-xm).^2/fi^2));

figure
plot(X,gauss,'-r')
xlabel('wiek');
ylabel('rozklad jazdy dobrze znany')
title('ROZKŁAD JAZDY DOBRZE ZNANY')
hold on
histogram(X,'Normalization','pdf');
