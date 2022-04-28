lc=1e-2;

Point(1) = {-1,0,0,lc};
step=Pi/8;
s=0;
// my_new_point[0]=2;

// p=0;
For theta In {step:2*Pi:step}
    If (theta==step)
        old = 1;
        s+=1;
        
        my_new_point[] = Rotate {{0,0,1},{0,0,0},theta} {Duplicata{Point{1};}};
        Printf("New Point %g",my_new_point[0]);


        Spline(s) = {1,my_new_point[0]};
        // p+=1;
    
    Else
        old = my_new_point[0];
        Printf("Old Point %g",old);
        s+=1;
       my_new_point[] = Rotate {{0,0,1},{0,0,0},theta} {Duplicata{Point{1};}};
        Spline(s) = {old,my_new_point[0]};
        // p+=1;
        Printf("New Point %g",my_new_point[0]);
        

    EndIf
    p=my_new_point[0];




EndFor
Spline(s+1) = {p,1};
    
new_list[4]=1;
Printf("%g",new_list[4]);
        
