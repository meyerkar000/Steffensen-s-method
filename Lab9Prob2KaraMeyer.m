%Kara Meyer
%4-30-2018
%This program tells you where f(x)=0 using Steffensen’s method

clear all;

%define your functions
func=@(x) x-2*exp(-x);

%ask the user for input
xi=input('Whats your guess for where f(x)=0: ');

%run the function
[xi,error,count]= steffensenmethod(func,xi);
if count<100
    formatSpec =('The root of your function is at x=%4.3f. The error is %5.3f*10^-10. Your program was run %2.0f times.');
    newError=error*10^10;
    fprintf(formatSpec,xi,newError,count)
else
    disp('Your guess is too inaccurate. Try again.')
end

function [xi,error,count]= steffensenmethod(func,xi)
    %define variables
    error=1;
    count=0;

    %Run until the error is less thant 10^-6%
    while error>=10^-6 && count<100
        xiOld=xi;
        xi=xi-((func(xi))^2/(func(xi+func(xi))-func(xi)));
    
        %Find your error
        error=abs((xi-xiOld)/xi);
    
        %Count how many times this program is run
        count=count+1;
    end

end