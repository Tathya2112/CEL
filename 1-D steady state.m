L = 0.1;  
Nx = 50;  
dx = L / (Nx - 1);


k = 400; 

T = zeros(Nx, 1);


T_left = 100; 
T_right = 200; 


T(1) = T_left;
T(end) = T_right;

tolerance = 1e-5;
max_iterations = 5000;

for iter = 1:max_iterations
    T_old = T;
    
    for i = 2:Nx-1
        T(i) = 0.5 * (T(i+1) + T(i-1));
    end
    

    if max(abs(T - T_old)) < tolerance
        break;
    end
end


x = 0:dx:L;
plot(x, T, '-o');
title('Temperature Distribution in a 1D Copper Plate');
xlabel('Position (m)');
ylabel('Temperature (°C)');
grid on;