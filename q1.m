% Q1)
% Deliverables: one script, three Smith charts and four answers.


z0 = 75; 
vp = 2e+8;
length_l = 0.25;

capacitance = 100e-12; % 100 pF in [F]
inductance = 100e-9; % 100 nH in [H]
resistance = 75; % 75 Ω in [Ω]
frequencyvector = 1e+6:1e+6:400e+6; % frequency, from 1 [MHz] to 400 [MHz] in 1 [MHz] intervals
angularfrequency = 2 * pi * frequencyvector; 

% initial conditions


% a)  series RC circuit, ZL = R + 1/jωC, with R = 75 Ω and C = 100 pF
impedenceRC = resistance + -1i ./ (angularfrequency .* capacitance); % using element division and multiplication

% b)  series RL circuit, ZL = R + jωL, with R = 75 Ω and L = 100 nH
impedenceRL = resistance + (1i .* angularfrequency .* inductance);

% c)  series RLC circuit, ZL = R + 1/jωC  + jωL, with R = 75 Ω, L = 100 nH and C = 100 pF
impedenceRLC = resistance +  (1i .* angularfrequency .* inductance) +  (-1i ./ (angularfrequency .* capacitance));



% Create Arrays for Each Impedence
gammaRC = zeros(1, length(impedenceRL)); 
gammaRL = zeros(1, length(impedenceRL));
gammaRLC = zeros(1, length(impedenceRLC));

% Apply function to each circuit
for i = 1:length(impedenceRLC)
    gammaRC(i) = reflection(impedenceRC(i), z0);
    gammaRL(i) = reflection(impedenceRL(i), z0);
    gammaRLC(i) = reflection(impedenceRLC(i), z0);
end


printSmithPDF(1, "RC Circuit", gammaRC, frequencyvector)
print -dpdf q1RCcircuit

printSmithPDF(2, "RL Circuit", gammaRL, frequencyvector)
print -dpdf q1RLcircuit

printSmithPDF(3, "RLC Circuit", gammaRLC, frequencyvector)
print -dpdf q1RLCcircuit

