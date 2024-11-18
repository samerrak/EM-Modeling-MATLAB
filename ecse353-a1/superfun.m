% superfun
%
% authors: Honoria Glossop and Hildebrand Glossop
% last revision: 01-11-2021
% description: A super fun example of a MATLAB script for students of
% ECSE-353. The script shows how one can generate simple data that
% is plotted beautifully.
%

clear all; % clear the working environment

timevector = 0:0.01:10; % time, from 0 [s] to 10 [s] in 0.01 [s] steps
A = 2*cos(3*timevector);
% 2 cos(3t) evaluated from t = 0 to 10
B = 2*exp(-0.3*timevector) .* cos(3*timevector);
% 2 exp(-0.3t) cos(3t) evaluated from t = 0 to 10
% note that “.*” achieves multiplication of respective array elements
C = 2*exp(1i*3*timevector); % 2 exp(j3t) evaluated from t = 0 to 10
% 2 exp(j3t) evaluated from t = 0 to 10
% note that “1i” is j = (-1)^(1/2), which can also be called by “i” or “j”
fig = figure(1); % plot A versus time
h = plot(timevector, A);
set(h,'Linewidth',1);
set(gca,'LineWidth',1);
set(gca,'FontSize',18);
grid;
xlabel('Time [s]');
ylabel('Voltage [V]');
title('cosine');
set(gcf,'paperunits','points');
set(gcf,'PaperPosition', [0 0 800 600]);
set(gcf,'PaperSize',[800 600]);
axis([0 10 -2 2]);
print -dpdf 353_example_cosine
fig = figure(2); % plot B versus time
h = plot(timevector, B);
set(h,'LineWidth',1);
set(gca,'LineWidth',1);
set(gca,'FontSize',18);
grid;
xlabel('Time [s]');
ylabel('Voltage [V]'); 