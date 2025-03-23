n=20;
xval=0:0.1:2;
taylorswift=zeros(size(xval));
wbdexp=exp(xval);

for i=1:length(xval)
    x=xval(i);
    taysum=1;
    one=1;
    for k=1:n-1
        one=one*(x/k);
        taysum=taysum+one;
    end
    taylorswift(i)=taysum;
end


for i=1:length(xval)
    fprintf('x=%.1f, taylor %8f , exp(x) %.8f , err %.10f \n' ,...
    xval(i),taylorswift(i),wbdexp(i)...
    ,abs(wbdexp(i)-taylorswift(i)))
end;