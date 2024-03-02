//locrain yota
///Yota Morimoto Walkthrough, https://gist.github.com/yotamorimoto/e1e8db5ee6e12ef1eceeb9a1e048b612#file-walkthrough-scd (Links to an external site.)
// install
Quarks.clear;
Quarks.install("https://github.com/yotamorimoto/sc_ca.git");
Quarks.install("https://github.com/yotamorimoto/sc_sample.git");
// recompile class library
// before proceeding
// look
Pca1({2.rand}!512, 50).plot;
// stream
~stream = Pca1({2.rand}!9, 110).asStream;
~stream.next;
// sample
~sample = Sample.felt;
~sample.map[60];
// sound func
(
~sound = { |buf, rate, pan=0|
var sig = PlayBuf.ar(1, buf, rate, doneAction:2);
Pan2.ar(sig, pan);
};
)
// play
(
~map =  ~sample.map[64];
~sound.play(args: [buf:~map[0], rate:~map[1], pan: 0.5.rand2]);
)
// degree to midi note
(
~d2k = { |degree, mode|
var size = mode.size;
var deg = degree.asInteger;
12 * deg.div(size) + mode[deg%size];
};
)
// use it
~mode = Scale.locrian.degrees;//changed lydian to locrian
~d2k.(-2, ~mode);
// use cellular automaton states as gates
(
~gates = ~stream.next;
~gates.do { |gate, i|
if(gate == 1, {
~map =  ~sample.map[~d2k.(i, ~mode) + 60];
~sound.play(args: [buf:~map[0], rate:~map[1], pan: 0.5.rand2]);
})
};
)
// add reverb send
(
~sound = { |buf, rate, pan=0|
var sig = PlayBuf.ar(1, buf, rate, doneAction: 2);
Out.ar(x, sig * -6.dbamp);
Pan2.ar(sig, pan);
};
)
// reverb
(
x.free;
x = Bus.audio(s,2);
SynthDef(\verb, {
var sig,fb;
sig = x.ar(2);
sig = HPF.ar(sig,200);
5.do { sig = AllpassN.ar(sig, 0.05, {0.050.rand}!2, 1) };
fb = LocalIn.ar(2)*0.8;
fb = AllpassN.ar(fb, 0.05, 0.050.rand, 2);
fb = DelayN.ar(fb, 0.1, 0.1);
fb = Rotate2.ar(fb[0], fb[1], 0.23);
sig = fb + sig;
LocalOut.ar(sig);
Out.ar(0, sig);
}).add;
)
// play in loop
(
Synth.tail(s,\verb);
Routine {
loop {
~gates = ~stream.next;
~gates.do { |gate, i|
if(gate == 1, {
~map =  ~sample.map[~d2k.(i, ~mode) + 60];
~sound.play(args: [buf:~map[0], rate:~map[1], pan: 0.5.rand2]);
});
};
0.3.wait;
}
}.play;
)