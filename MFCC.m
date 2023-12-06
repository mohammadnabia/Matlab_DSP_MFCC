%% Open a wave file
[Y,FS,WMODE,FIDX]=readwav('f100.wav');
%% playe the wave file
player = audioplayer(Y(1:1:72000), FS);
play(player);
%% windowing the signal with the hamming window by the size of 10ms = 100hz
Windowsh=0.0125;
% split into frames of length FS*Windows
fh = enframe(Y,hamming(FS*Windowsh));  
fprintf('hamm window size =%ihz = %ims\n', FS*Windowsh,1000/(FS*Windowsh));

%% windowing the signal with the rect window by the size of 20ms = 50hz
Windowsr=0.00625;
% split into frames of length FS*Windows
fr = enframe(Y,rectwin(FS*Windowsr));  
fprintf('rect window size = %ihz = %ims', FS*Windowsr,1000/(FS*Windowsr));
%% Real Cepstrum on rect window
Cr=rceps(fr);
%% Real Cepstrum on hamming window
Ch=rceps(fh);

%% MFCC on rect window of 26 coefficients
%     Y	  speech signal
%     FS  sample rate in Hz
%     ncr  number of cepstral coefficients excluding 0'th coefficient [default 12]
ncr = 26;
%     nr   length of frame in samples (we set it to 50hz)
nr = 50;
MFCCr = melcepst(Y,FS,'R',ncr,floor(3*log(FS)),nr);



%% MFCC on hamming window of 39 coefficients
%     Y	  speech signal
%     FS  sample rate in Hz
%     ncr  number of cepstral coefficients excluding 0'th coefficient [default 12]
nch = 39;
%     nr   length of frame in samples (we set it to 50hz)
nh = 100;
MFCCh = melcepst(Y,FS,'M',nch,floor(3*log(FS)),nh);



