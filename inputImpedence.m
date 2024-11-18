% authors: Samer Abdulkarim
% last revision: 12-11-2024
% description: Functions that help me implement the required exercies

function inputImp = inputImpedence(phasegamma)
            inputImp = (1 + phasegamma) / (1 - phasegamma);
end