s.boot

~net = NetAddr("127.0.0.1", 47120);

~net.sendMsg("/change_position", 50.0,0.0,300);

(
SynthDef(\blip, {arg freq = 300, dur = 0.2, amp = 1.0;
	var sound = SinOsc.ar([freq,freq]);
	sound = sound * Line.kr(1,0,dur,doneAction:2);
	Out.ar(0,sound*amp);
}).add
)

(
var freq_stream = Pseq([500,600,700,800,900,1000,2000,3000],inf).asStream;
var dur_stream = Pseq([0.2,0.3,0.4,0.5,0.6,0.7,1.0,2.0],inf).asStream;
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