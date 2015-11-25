T = (0:1/200:99*1/200);

x = fopen('estimulac_dec.txt','r');
signal = fscanf(x,'%f',[100])';

rampa = 200*T;

load resp_dec.txt
load estimulac_dec.txt
load resp_dec_trunc.txt

ideal = IPD(100,rampa); %angulo de referencia y estimulo


plot(T,ideal,'r',T,resp_dec,'b',T,rampa,'k');
title('IPD Ideal vs IPD Xilinx');

datacursormode on


%Generación de estímulos para filtros reales

%  output = fopen('estimulac_bin.txt','wt');
%  
%  for i=1:length(rampa)
%      fprintf(output,'%s\n',dec2bin(rampa(i)));
%  end
%  
%  fclose(output);

