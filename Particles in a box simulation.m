					%Nines Pantos 



%------------------------------------------------------------------------------------------------------------------------------
format short
clear 
%---------------------------------------------------------------
%Initial Conditions
N = input('Insert number of nanoparticles in box A\n'); %Ask user for the number of nanoparticles.
t = 0;                                    %Initial time. 
total_time = 100000 ;                     %Time of simulation. 
%---------------------------------------------------------------
%Graph Axis
N_A = [1;total_time];                     %Number of particles in box A for every second t.
N_B = [1;total_time];                     %Number of particles in box B for every second t.
time_axis = [1;total_time];               %A vector with values the seconds pased with step one.
N_theoritical = [1;total_time];           %A vector with the number of partciles in box A for every second from the theory.
%---------------------------------------------------------------
N_a = N;                                  %Number of particles in part A after time t
N_b = N - N_a;                            %Number of particles in part A
x = rand(total_time,1);                   %Generate a uniformly distirbuted random set of numbers x, 0<x<1
%---------------------------------------------------------------
%Simulation
for i=1:total_time
    side_criteria = N_a/N;               %Fraction of particles in part A with total particles
    r = x(i);       
    if  r < side_criteria                %Particle goes from A to B
        N_a = N_a - 1;
        N_b = N_b + 1;
    else                                 %Particle goes from B to A 
        N_a = N_a + 1;
        N_b = N_b - 1;
    end
N_A(i) = N_a;                       	  %Asing valuses of number of particles in box A to a vector in every second.
N_B(i) = N_b;                            %Asing valuses of number of particles in box A to a vector in every second.

N_theoritical(i) = number_of_nanoparticles(t,N); %Theoritical distirbution of nanoparticles after time t


time_axis(i) = t;                        %Vector with seconds of simulation
t = t + 1;                               %Time step = 1


end
%---------------------------------------------------------------
%Ghraph of simulation
N_A = smooth(N_A);
plot(time_axis,N_A,time_axis,N_theoritical);
xlabel('Time');
ylabel('Number of Nanoparticles in box A');
legend('Simulation','Theory')
%---------------------------------------------------------------
