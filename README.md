# Matlab MFCC
<sub> Description: MATLAB code for audio signal processing, emphasizing Real Cepstrum and MFCC feature extraction. It reads a wave file, applies Hamming and Rectangular windows, and then computes Real Cepstrum. Utilizes MATLAB's built-in functions for extracting MFCC features. Perfect for audio analysis and feature engineering. </sub>
- - -

# Introduction:
This repository contains MATLAB code for audio signal processing, primarily focusing on feature extraction techniques. The code reads a specified wave file, applies various windowing functions, and extracts Real Cepstrum and Mel Frequency Cepstral Coefficients (MFCC).

# Usage:
## Open a Wave File:
```Matlab
[Y,FS,WMODE,FIDX]=readwav('f100.wav');
```

## Play the Wave File:
```Matlab
player = audioplayer(Y(1:1:72000), FS);
play(player);
```

## Windowing with Hamming Window:
```Matlab
Windowsh = 0.0125;  % Window size in seconds
fh = enframe(Y, hamming(FS * Windowsh));
```

## Windowing with Rectangular Window:
```Matlab
Windowsr = 0.00625;  % Window size in seconds
fr = enframe(Y, rectwin(FS * Windowsr));
```

## Real Cepstrum:
### On Rectangular Window:
```Matlab
Cr = rceps(fr);
```
### On Hamming Window:
```Matlab
Ch = rceps(fh);
```

## MFCC on Rectangular Window:
```Matlab
ncr = 26;  % Number of cepstral coefficients
nr = 50;   % Frame length in samples
MFCCr = melcepst(Y, FS, 'R', ncr, floor(3*log(FS)), nr);
```

## MFCC on Hamming Window:
```Matlab
nch = 39;  % Number of cepstral coefficients
nh = 100;  % Frame length in samples
MFCCh = melcepst(Y, FS, 'M', nch, floor(3*log(FS)), nh);
```

## Contributing
Contributions to this repository are welcome. If you have any improvements, bug fixes, or additional examples related to voice signal analysis, please feel free to submit a pull request. Let's collaborate and make this repository a valuable resource for the community.

## License
This project is licensed under the MIT License. You can use, modify, and distribute the code as the license permits.

Happy coding! 👾
- - -

<sub> Additional information:
The waveform used in this project is an English voice saying, "Oak is strong and also gives shade." The file of this waveform is named f100.wav, and you can access this file in the repository. </sub>
