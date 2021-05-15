s.boot;
{ var freq = 50; Mix.ar(SinOsc.ar((0.1,0.2..19)*freq) *0.01 )!2 }.play
