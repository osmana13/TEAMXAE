s.boot;

~b9 = Buffer.read (s,"/Users/osmana13/Documents/104/deskBell11_Bb.aiff");
~b9.play;

(
OSCdef.new (
	\abutton,
	{
		arg msg;
		msg[1].postln;
	},
	'/a'
);
)

(
SynthDef.new(\ayanSynth, {
	arg ayansamp, startpos, pace, volume=1, out, panloc, panrate, loop;
	var sig;
	sig =  PlayBuf.ar(
		numChannels: ayansamp.numChannels,
		bufnum: ayansamp,
		rate: pace,
		//startPos: ayansamp.numFrames,
		loop: loop,
		doneAction: 2;);
	sig = sig * volume;
	Out.ar(0, Pan2.ar(sig, panloc);); // SinOsc.kr(MouseX.kr.range(0,5))
}).add;
);


w = Synth.new(\ayanSynth, [\ayansamp, ~b9, \pace, 1, \panloc, -1, \volume,0.5 , \loop, 1]);

(
OSCdef.new(\wii/1/button/A,{
	arg msg,
	msg[1].postln;
	w.set
},
'\wii/1/button/A'
)
);
);