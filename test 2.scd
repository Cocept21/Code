s.boot
~net = NetAddr("127.0.0.1",47120);

~net.sendMsg("/change_position");

(
SynthDef(\SinOsc,{ arg out=0, note=60, amp=0.25, pan=0.0;
	var freq, env;
	freq = note.midicps;
	env = EnvGen.ar(
		Env([9,2,2,2],[0.01, 0.02, 0.3]),
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
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,Pseq([65],3),68,60,60,Pseq([0],5) ], inf), \dur, 1 ).play;
fork{ loop{
	~net.sendMsg("/change_position");
	1.wait;
}}
)


(
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,Pseq([65],3),68,60,60,Pseq([0],5) ], inf), \dur, 1 ).play;
fork{ loop{
	~net.sendMsg("/change_position");
	1.wait;
}}
)


~net.sendMsg("/rect");


(
Pbind(\instrument, \SinOsc, \note, Pseq([65,66,Pseq([65],3),68,60,60,Pseq([0],5) ], inf), \dur, 1 ).play;
fork{ loop{
	~net.sendMsg("/rect");
	1.wait;
}}
)










Pbind(\instrument, \SinOsc, \note, Pseq([65,66], inf), \dur, 1/3 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([70], inf), \dur, 1 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([74,75], inf), \dur, 1 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([76,75,74,73], inf), \dur, 1 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([50], inf), \dur, 1 ).play;
Pbind(\instrument, \SinOsc, \note, Pseq([52,53,54,55,56,57,58,59,60,0,0,0], inf), \dur, 1/3 ).play;