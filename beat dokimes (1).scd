s.boot


(
SynthDef(\SinOsc,{ arg out=0, note=60, amp=0.25, pan=0.0;
	var freq, env;
	freq = note.midicps;
	env = EnvGen.ar(
		Env([9,2,2,2],[0.1, 0.2, 0.5]),
		levelScale:amp,
		doneAction:2
	);
	Out.ar(out,
		Pan2.ar(SinOsc.ar (freq) * env, pan)
	)
}).add;
)

a = Synth(\SinOsc,[\note, 60])   /// Midi number 60 = C4


(
SynthDef(\LFCub,{ arg out=0, note=60, amp=0.25, pan=0.0;
	var freq, env;
	freq = note.midicps;
	env = EnvGen.ar(
		Env([9,2,2,2],[0.1, 0.2, 0.5]),
		levelScale:amp,
		doneAction:2
	);
	Out.ar(out,
		Pan2.ar(LFCub.ar (freq) * env, pan)
	)
}).add;
)

a = Synth(\LFCub,[\note, 50])   /// Midi number 60 = C4


(
SynthDef(\neurosnare, {
    var snd;
    // a percussive click to give it some attack
    snd = LPF.ar(HPF.ar(WhiteNoise.ar, 300), 8000) * Env.linen(0.1, 0.01, 0.00001).ar;
    // sine sweep body. very important!
    snd = snd + (SinOsc.ar(Env([400, 196, 160], [0.04, 0.2], \exp).ar) * Env.perc(0.04, 0.2).ar * 6.dbamp).tanh;
    // sound of snare coils rattling
    snd = snd + (HPF.ar(BPeakEQ.ar(WhiteNoise.ar, 4000, 0.5, 3), 300) * Env.perc(0.05, 0.2).delay(0.01).ar(2) * -3.dbamp);
    // another sound sweep to improve the attack, optional
    snd = snd + (SinOsc.ar(XLine.kr(3000, 1500, 0.01)) * Env.perc(0.001, 0.02).ar);
    // distortion helps glue everything together and acts as a compressor
    snd = (snd * 1.4).tanh;
    snd = Pan2.ar(snd, \pan.kr(0), \amp.kr(0.1));
    Out.ar(\out.kr(0), snd);
}).add;
)

Synth(\neurosnare, [amp: 0.04]);


//beat 1
(
Pbind(\instrument, \LFCub, \note, Pseq([0,0,0,0,75,70,60], inf), \dur, 1).play;
Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/2).play;
Pbind(\instrument, \SinOsc, \note, Pseq([0,0,0,72,72 ], inf), \dur, 1/4 ).play;
Pbind(\instrument, \LFCub, \note, Pseq([50,0,0,0,60,60], inf), \dur, 1).play;
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,65,65,65,68,60,60,0,0,0,0,0 ], inf), \dur, 1 ).play;
Pbind(\instrument, \neurosnare, \note, Pseq([10], inf,), \dur, 2).play;
)

//beat 2
(
Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/3).play;
Pbind(\instrument, \LFCub, \note, Pseq([71,0,0,0,0,0,0,0,0,0], inf), \dur, 1/3).play;
Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/4).play;
Pbind(\instrument, \LFCub, \note, Pseq([70,70,7,70,70,0,50], inf), \dur, 1/6).play;
Pbind(\instrument, \LFCub, \note, Pseq([60,60,60,60,60,60,60], inf), \dur, 1/3).play;
Pbind(\instrument, \LFCub, \note, Pseq([70,70,0,0,0,0,0,0,0], inf), \dur, 1/6).play;
)

//beat 3
(
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,65,65,65,68,60,60,70,70,60,60,68,65,65,72,72,72,55,72,72,72,52,72,52,51,72,72,71,72,72,72,55,72,72,72,52,72,52,51,72,72 ], inf), \dur, 1/4 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([45,46,45,45,45,48,40,40,50,50,40,40,48,45,45,52,52,52,35,52,52,52,52,52,52,51,52,52,51,52,52,52,55,52,52,52,52,52,52,51,52,2 ], inf), \dur, 2 ).play;
)

//beat4
(
Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/2).play;
Pbind(\instrument, \SinOsc, \note, Pseq([0,0,0,0,0,0,72,72 ], inf), \dur, 1/3 ).play;
Pbind(\instrument, \LFCub, \note, Pseq([50,60,60,0,0], inf), \dur, 1).play;
Pbind(\instrument, \LFCub, \note, Pseq([0,0,0,0,75,70,60], inf), \dur, 1).play;
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,65,65,65,68,60,60,0,0 ], inf), \dur, 1/2 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([40,42,43,43,43,48,40,40,50,50,40,40,48,45,45,52,52,52,35,52,52,52,52,52,52,51,52,52,51,52,52,52,55,52,52,52,52,52,52,51,52,2 ], inf), \dur, 2 ).play;
)

//beat 5
(
Pbind(\instrument, \SinOsc, \note, Pseq([45,46,45,45,45,48,40,40,50,50,40,40,48,45,45,52,52,52,35,52,52,52,52,52,52,51,52,52,51,52,52,52,55,52,52,52,52,52,52,51,52,2, ], inf), \dur, 1/5).play;
Pbind(\instrument, \SinOsc, \note, Pseq([45,46,45,45,45,48,40,40,50,50,40,40,48,45,45,52,52,52,35,52,52,52,52,52,52,51,52,52,51,52,52,52,55,52,52,52,52,52,52,51,52,2 ], inf), \dur, 1).play;
)

//beat 6
(
Pbind(\instrument, \SinOsc, \note, Pseq([65,65,65,65,65,65,66,67,60,60,60,60,60,60,40,40,40,55,40,40,60,70,60,70,60,70,70,72], inf), \dur, 1/3).play;
)

//beat7
(
Pbind(\instrument, \LFCub, \note, Pseq([60,61,65,60,61,75,70,71,75,70,71,75,0,0,0,0,0,0,0,74,74,73,70,70,50,50,70,74,74,74], inf), \dur, 1/4).play;
Pbind(\instrument, \LFCub, \note, Pseq([70,71,60,0,0,0,0,0,0,70,60], inf), \dur, 1/2).play;
Pbind(\instrument, \LFCub, \note, Pseq([40,40,40,45,0,0,0,0], inf), \dur, 1/2).play;
)














