OSCFunc.trace(true);
OSCFunc.trace(false);
s.boot;


~b1 = Buffer.read (s,"/Users/osmana13/Documents/104/untitled folder/bird.aiff");

~b2 = Buffer.read (s,"/Users/osmana13/Documents/104/untitled folder/elephant.aiff");

~b3 = Buffer.read (s,"/Users/osmana13/Documents/104/untitled folder/lion.aiff");

~b4 = Buffer.read (s,"/Users/osmana13/Documents/104/untitled folder/safari.aiff");

~b5 = Buffer.read (s,"/Users/osmana13/Documents/104/deskBell11_Bb.aiff");

~b6 = Buffer.read (s,"/Users/osmana13/Documents/104/loooool.aiff");

~b7 = Buffer.read (s,"/Users/osmana13/Documents/104/deskBell09_Ab.aiff");


(
OSCdef.new (
	\button1,
	{
		arg msg;
		msg[1].postln;

		if(msg[1]==1){
			~b1.play;
			w.set

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
			w.set

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
			w.set

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
			w.set

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
			w.set

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
			w.set

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
			w.set

		}

	},
	'/9'
);
)



w = Synth.new(volume,0.5);


