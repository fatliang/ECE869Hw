clear all;
k = [0:40];
A = [30:0.1:31];
Pr = zeros(1,length(A));
for i = 1:length(A)
seq = (A(i).^k)./factorial(k);
Pr(i) = seq(end)/sum(seq);
end
Pr