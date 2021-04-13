s.boot

~net = NetAddr("127.0.0.1", 47120);

~net.sendMsg("/change_position", 50.0,0.0,300);

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






Pbind(\instrument, \LFCub, \note, Pseq([50,0,0,0,60,60], inf), \dur, 1).play;

Pbind(\instrument, \SinOsc, \note, Pseq([65,66,65,65,65,68,60,60,0,0,0,0,0 ], inf), \dur, 1 ).play;




var freq_stream = Pbind(\instrument, \LFCub, \note, Pseq([0,0,0,0,75,70,60], inf), \dur, 1).asStream;
var dur_stream = Pbind(\instrument, \LFCub, \note, Pseq([70], inf), \dur, 1/2).asStream;
var amp_stream = Pseq([0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0],inf).asStream;

fork{loop{
	var freq = freq_stream.next;
	var dur = dur_stream.next;
	var amp = amp_stream.next;
	var position_x = ControlSpec(0,300).map(freq/4000);
	var position_y = ControlSpec(0,300).map(amp);
	var size = ControlSpec(20,300).map(dur/2);

	Synth(\blip, [\freq, freq, \dur, dur, \amp, amp]);
	~net.sendMsg("/change_position", position_x, position_y, size);
	dur.wait;
}}

)