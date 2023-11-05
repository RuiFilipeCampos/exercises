[N, Wn] = ellipord (0.4, 0.5, 0.5, 40)
[b,a]   = ellip (N, 0.5, 40, Wn)
w = 0:.01:pi
h       = freqz (b, a, w)
g = 20*log10(abs(h))
plot(w/pi,g)