 function [w0]= waveform(fc,Tm,tau)
  dt = 1 / fc;            % reference sampling period
  OVER = floor(Tm/dt);    % number of samples representing the pulse                     
  e = mod(OVER,2);
  kbk = floor(OVER/2);
  tmp = linspace(dt,Tm/2,kbk);
  s = (1-4.*pi.*((tmp./tau).^2)).* ...
      exp(-2.*pi.*((tmp./tau).^2));
  if e                    % OVER is odd
      for k=1:length(s)
          y(kbk+1)=1;
          y(kbk+1+k)=s(k);
          y(kbk+1-k)=s(k);
      end
  else                    % OVER is even
      for k=1:length(s)
          y(kbk+k)=s(k);
          y(kbk+1-k)=s(k);
      end
  end
    E = sum((y.^2).*dt);  % pulse energy
  w0 = y ./ (E^0.5);      % energy normalization
  