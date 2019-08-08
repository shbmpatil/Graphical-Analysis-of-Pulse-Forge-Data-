clear all
close all
clc

filename = 'Hsu Lab Compiled Data (PET_ITO).xlsx';

Voltage = xlsread(filename,'A2:A500');
Time = xlsread(filename,'B2:B500');
Energy = xlsread(filename,'D2:D500');
TMax = xlsread(filename,'E2:E500');
Wrinkle = xlsread(filename,'H2:H500');
Crack = xlsread(filename,'J2:J500');

Time_fixed = Time + 1000;

figure(1)
ylim([0,2000])
for i=1:1:length(Voltage)
    if (Crack(i))== 1
        scatter(Voltage(i),Time(i),15*Energy(i),'MarkerFaceColor','r','MarkerEdgeColor','k');
        hold on
    elseif (Wrinkle(i))== 1
        scatter(Voltage(i),Time(i),15*Energy(i),'MarkerFaceColor','y','MarkerEdgeColor','k');
        hold on
    else
        scatter(Voltage(i),Time(i),15*Energy(i),'MarkerFaceColor','g','MarkerEdgeColor','k');
        hold on
    end
end 
box on
xlim([340 510])
ylim([0 6000])
xlabel('Voltage, V')
ylabel('Time, t (us)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
for i=1:1:length(Voltage)
    if (Crack(i))== 1
        scatter(Energy(i),TMax(i),Time_fixed(i)/100,'MarkerFaceColor','r','MarkerEdgeColor','k');
        hold on
    elseif (Wrinkle(i))== 1
        scatter(Energy(i),TMax(i),Time_fixed(i)/100,'MarkerFaceColor','y','MarkerEdgeColor','k');
        hold on
    else
        scatter(Energy(i),TMax(i),Time_fixed(i)/100,'MarkerFaceColor','g','MarkerEdgeColor','k');
        hold on
    end
end 
box on
ylim([0 600])
xlabel('Radiant Exposure (J/cm2)')
ylabel('PeakTemp (°C)')