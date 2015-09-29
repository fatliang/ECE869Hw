%BFSK simulation
fc = 10;
Ac = 2;
Tsym = 2;%symbol length in secs
Tsam = 0.001;%sampling interval in secs
symbol = [1 0 1 1 1 0 0 1];

period = [0:Tsam:Tsym-0.01];

delta = 2;
signal_2 = zeros(0);
for i = 1:length(symbol)
    signal_2 = [signal_2, Ac*cos(2*pi*(fc+0.5*delta*(symbol(i)*2-1))*period)];
end

delta = 3;
signal_3 = zeros(0);
for i = 1:length(symbol)
    signal_3 = [signal_3, Ac*cos(2*pi*(fc+0.5*delta*(symbol(i)*2-1))*period)];
end

t = [0:length(signal_2)-1]*Tsam;
figure();
subplot(2,1,1);
plot(t, signal_2);
title({'BFSK signal waveform'; 'delta = 2'});
xlabel('t(sec)');
ylabel('f');
ylim([-3,3]);
subplot(2,1,2);
plot(t, signal_3);
title('delta = 3');
xlabel('t(sec)');
ylabel('f');
ylim([-3,3]);