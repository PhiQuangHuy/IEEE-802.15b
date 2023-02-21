function [PAMDSseq,DSseq] = ...
 PAM_DS(seq,fc,Ts,DScode)
% --------------------------------------------------
% Step One - Implementation of the 2PPM+DS modulator
% --------------------------------------------------
dt = 1 ./ fc; % sampling period
framesamples = floor(Ts ./ dt); % number of samples
DSp = length(DScode); % DS code periodicity
totlength = framesamples*length(seq);
PAMDSseq = zeros(1,totlength);
DSseq = zeros(1,totlength);
% ------------------------------------------------
% Step Two - Main loop for introducing DS and 2PAM
% ------------------------------------------------
for k = 1 : length(seq)

 % uniform pulse position
 index = 1 + (k-1)*framesamples;

 % introduction of DS
 kDS = DScode(1+mod(k-1,DSp));

 DSseq(index)=kDS;

 % introduction of 2PAM
 PAMDSseq(index) = kDS*((seq(k)*2)-1);

end 