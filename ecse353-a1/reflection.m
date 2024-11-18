% authors: Samer Abdulkarim
% last revision: 12-11-2024
% description: Functions that help me implement the required exercies

function reflectionCoeff = reflection(zl, z0)
    % Calculate normalized load impedance
    zL = zl / z0;
    
    % Calculate the reflection coefficient
    reflectionCoeff = (zL - 1) / (zL + 1);
end