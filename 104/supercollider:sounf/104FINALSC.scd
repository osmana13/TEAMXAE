(
OSCFunc.trace(true);
OSCFunc.trace(false);
s.boot;
)

play{n=rrand(20,70);Pulse.ar(({rrand(0.2,n)}*Lag.kr(Dust.kr(n.pow(3)!2).exprange(1,10),0.4))!n,{rand(pi)}!n,n.reciprocal).sum}

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
	Out.ar(0, Pan2.ar(sig, panloc););
}).add;
);


~b1 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/elephant.aiff");

~b2 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/lion.aiff");

~b3 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/safari.aiff");

~b4 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/bird.aiff");

~b5 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/deskBell03_D.aiff");

~b6 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/deskBell09_Ab.aiff");

~b7 = Buffer.read (s,"/Users/osmana13/Documents/104/supercollider:sounf/deskBell11_Bb.aiff");




(
OSCdef.new (
	\button1,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b1.play;


		}

	},
	'/1'
);
)



(
OSCdef.new (
	\button2,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b2.play;


		}

	},
	'/2'
);
)



(
OSCdef.new (
	\buttona,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b3.play;


		}

	},
	'/a'
);
)




(
OSCdef.new (
	\buttonb,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b4.play;


		}

	},
	'/b'
);
)



(
OSCdef.new (
	\buttonminus,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b5.play;
			x.set(\volume, msg[1]);

		}

	},
	'/7'
);
)

(
OSCdef.new (
	\buttonhome,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b6.play;
			y.set

		}

	},
	'/8'
);
)

(
OSCdef.new (
	\buttonplus,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b7.play;
			z.set

		}

	},
	'/9'
);
)


(
x = Synth.new(\ayanSynth, [\ayansamp, ~b5, \pace, -1, \panloc, -1, \volume,7 , \loop, 0]);
y = Synth.new(\ayanSynth, [\ayansamp, ~b5, \pace, 0, \panloc, 1, \volume,2.5 , \loop, 0]);
z = Synth.new(\ayanSynth, [\ayansamp, ~b5, \pace, 1, \panloc, 0, \volume,0, \loop, 0]);

)
