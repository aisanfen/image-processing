arg=input('Input argument:');
total=0;detail=0;
switch arg
    case 1 
        i=1;
        while(i<=5)
            total=total+1;
            i=i+1;
            j=1;
            while(j<=2)
                detail=detail+total;
                j=j+0.1;
            end
        end
    case 2
        total=0;
        detail=total;
    case others
        error('Invalid arguments');
end
detail