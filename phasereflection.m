% authors: Samer Abdulkarim
% last revision: 12-11-2024
% description: Functions that help me implement the required exercies

function phaseShiftedReCoeff = phasereflection(gamma, beta, length_l)
            phaseShiftedReCoeff = gamma * exp(-1i*2*beta*length_l);
end