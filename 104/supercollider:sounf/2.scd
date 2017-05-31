s.boot;


(
OSCdef.new (
	\pitch,
	{
		arg msg;
		msg[1].postln;
	},
	'wii/1/accel/pry/0'
);
)

OSCdef(\pitch).disable;


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
OSCdef.new (
	\bbutton,
	{
		arg msg;
		msg[1].postln;
	},
	'/b'
);
)


(
OSCdef.new (
	\button1,
	{
		arg msg;
		msg[1].postln;
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
	},
	'/2'
);
)







(((
OSCdef.new ( \abutton,
	{
		arg msg;
	if(
		msg[1]==1,
	{
	a = a.add(

	var trigs, freq;
	trigs = Dust.kr(170);
	freq =
		// Generally choose from a varied base freq
		TExpRand.kr(800, 2000, trigs)
		// Wobbly variation
		+ LFNoise2.kr(20, mul: 300)
		// General tendency for upward rise
		+ EnvGen.kr(Env.perc(1).range(0,17), trigs)
		;
	SinOsc.ar(freq, 0, 0.3)
}.play;
);
)
		), '/a'



		(
OSCdef.new(\faderC,{
	arg msg, time, addr,port;
	msg[1].postln;
	w.set(\volume, msg[1]);
},
'/1/faderC'
)
);
);


		(
OSCdef.new(\wii/1/buttonA,{
	arg msg, time, addr,port;
	msg[1].postln;
    Pbind (
	    \instrument, \sine,
	    \dur, Pwhite(0.05, 0.5, inf),
		\midinote, Pseq ([25,32,35,38,20,35,30,32],inf).trace,
	    \harmonic, Pexprand(1, 21, inf).round,
	    \atk, Pwhite(1.0,3.0, inf),
	    \rel, Pwhite(5.0, 10.0, inf),
	    \amp, Pkey(\harmonic).reciprocal * 0.3,
	   \pan, Pwhite(-0.08,0.8,inf),
},
'\wii/1/buttonA'
);
);