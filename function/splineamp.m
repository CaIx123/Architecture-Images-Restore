function pic_out = splineamp(pic,N)
    [m,n]=size(pic);
    pic_N=255-zeros(m,N*n);
    pic_NN=255-zeros(N*m,N*n);
    xl=1:n;
    xr=1:m;
    xql=1:1/N:n;
    xqr=1:1/N:m;
    
    for i=1:m
        pic_N(i:i,1:N*n-N+1)=spline(xl,double(pic(i:i,1:n)),xql);
    end
    %     
    for i=1:N*n
        temp=(pic_N(1:m,i:i))';
        pic_NN(1:N*m-N+1,i:i)=(spline(xr,double(temp),xqr))';
    end
    
%     pic_N=pic_N(1:N*m,1:N*n);
    pic_out=mat2gray(uint8(pic_NN));
end

