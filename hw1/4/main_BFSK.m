%BFSK simulation
fc = 10;
Ac = 2;
Tsym = 2;%symbol length in secs
Tsam = 0.001;%sampling interval in secs
symbol = [1 0 1 1 1 0 0 1];
period = [0:Tsam:Tsym-Tsam];%the duration of one symbol
delta = 2;

%calcuate the number of zero crossings in symbol 1 and symbol 0
num_1 = round(Tsym*(fc+delta/2)*2);
num_0 = round(Tsym*(fc-delta/2)*2);
threshold = (num_1+num_0)/2;

signal = zeros(0);
%modulation
for i = 1:length(symbol)
    signal = [signal, Ac*cos(2*pi*(fc+0.5*delta*(symbol(i)*2-1))*period)];
end

%demodulation
period_length = length(period);
symbol_rx = zeros(0);
for i = 1:floor(length(signal)/period_length)
    fetch = signal((i-1)*period_length+1:i*period_length);
    %first remove the zeros
    fetch = fetch(fetch ~= 0);
    %
    res = fetch(1:end-1).*fetch(2:end);
    count = sum(res < 0);
    if (count > threshold)
      symbol_rx = [symbol_rx, 1];
    else
      symbol_rx = [symbol_rx, 0];
    end
end
symbol_rx

t = [0:length(signal)-1]*Tsam;%the time interval
figure();
plot(t, signal);
title({'BFSK signal waveform'; 'delta = 2'});
xlabel('t(sec)');
ylabel('f');
ylim([-3,3]);
