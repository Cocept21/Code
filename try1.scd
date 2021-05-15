s.boot
~net = NetAddr("127.0.0.1",47120);

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
Pbind(\instrument, \LFCub, \note, Pseq([60,61,65,60,61,75,70,71,75,70,71,75,0,0,0,0,0,0,0,74,74,73,70,70,50,50,70,74,74,74], inf), \dur, 1/4).play;
Pbind(\instrument, \LFCub, \note, Pseq([70,71,60,0,0,0,0,0,0,70,60], inf), \dur, 1/2).play;
Pbind(\instrument, \LFCub, \note, Pseq([40,40,40,45,0,0,0,0], inf), \dur, 1/2).play;
fork{ loop{
	~net.sendMsg("/change_position");
	1.5.wait;
}}
)











 