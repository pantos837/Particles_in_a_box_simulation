						%Nines Pantos
						
						 
%------------------------------------------------------------------------------------------------------------------------------
%Number of nanoparticles in part x of the box after t seconds 
function [N_g] = number_of_nanoparticles(t,N)
N_g = round(N/2*(1+exp(-2*t/N)));
end 
