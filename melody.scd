///AndreasPatsalides
///Midterm exams 2021


s.boot;    /// boot the server

s.quit;    // close the server

s.meter    // metering

s.record   /// to record to a file




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

a = Synth(\LFCub,[\note, 60])   /// Midi number 60 = C4




//beat

Pbind(\instrument, \LFCub, \note, Pseq([0,0,0,0,75,70,60], inf), \dur, 1).play;

Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/2).play;

Pbind(\instrument, \SinOsc, \note, Pseq([0,0,0,72,72 ], inf), \dur, 1/4 ).play;

Pbind(\instrument, \LFCub, \note, Pseq([50,0,0,0,60,60], inf), \dur, 1).play;

Pbind(\instrument, \SinOsc, \note, Pseq([65,66,65,65,65,68,60,60,0,0,0,0,0 ], inf), \dur, 1 ).play;









 