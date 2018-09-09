arg=input('Input argument:');
total=0;detail=0;
if(arg==1)
    for i=1:1:5
        total=total+1;
        for j=1:0.1:2
            detail=detail+total;
        end
    end
elseif(arg==2)
    total=0;
    detail=total;
else
    error('Invalid argument!');
end
detail
