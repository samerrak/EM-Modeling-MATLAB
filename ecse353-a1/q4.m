% Q4)
% Deliverables: one script, one Smith chart, and one answer

z0 = 75; 
vp = 2e+8;
length_l = 0.25;

capacitance = 100e-12; % 100 pF in [F]
inductance = 100e-9; % 100 nH in [H]
resistance = 75; % 75 Ω in [Ω]
frequencyvector = 1e+6:1e+6:400e+6; % frequency, from 1 [MHz] to 400 [MHz] in 1 [MHz] intervals
angularfrequency = 2 * pi * frequencyvector; 
beta = angularfrequency / vp; 

impedenceRLC = resistance +  (1i .* angularfrequency .* inductance) +  (-1i ./ (angularfrequency .* capacitance));

gammaRLC = zeros(1, length(impedenceRLC));
gammaRotatedRLC = zeros(1, length(impedenceRLC));
zin = zeros(1, length(impedenceRLC));
% Apply function to each circuit
for i = 1:length(impedenceRLC)
    gammaRLC(i) = reflection(impedenceRLC(i), z0);
    gammaRotatedRLC(i) = phasereflection(gammaRLC(i), beta(i), length_l);
    zin(i) = inputImpedence(gammaRotatedRLC(i));
end

printSmithPDF(1, "Rotated Reflection Coefficient for RLC Circuit", gammaRotatedRLC, frequencyvector)
print -dpdf q4RotatedReflectionCoefficient.pdf
