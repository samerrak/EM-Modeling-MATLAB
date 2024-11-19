% Q3)
% Deliverables: one script, one impedance plot (with real and imaginary parts) and one answer.

clear all;

z0 = 75; 
vp = 2e+8;
length_l = 0.25;

zl = 0;
frequencyvector = 1e+6:1e+6:400e+6; % frequency, from 1 [MHz] to 400 [MHz] in 1 [MHz] intervals
angularfrequency = 2 * pi * frequencyvector; % omega = 2 * pi * f
beta = angularfrequency / vp; % beta = omega / vp
gamma = reflection(zl, z0); % reflection coefficient

% Create Arrays for the Smith Chart
gammaRotated = zeros(1, length(frequencyvector));
zin = zeros(1, length(frequencyvector));

% Calculate the reflection coefficient
for i = 1:length(frequencyvector)
    gammaRotated(i) = phasereflection(gamma, beta(i), length_l);
    zin(i) = inputImpedence(gammaRotated(i));
    
end

printSmithPDF(1, "Rotated Reflection Coefficient for Resistive Load at 0 Ω", gammaRotated, frequencyvector)
print -dpdf q3RotatedReflectionCoefficient.pdf

figure(2)

h = plot(frequencyvector,real(zin),frequencyvector,imag(zin));

title('Impedance Plot');

print -dpdf q3InputImpedencePlot.pdf