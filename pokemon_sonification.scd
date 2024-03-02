///Multi
(
{
var fund = 220;
var pokedexNum = 800;
var hp = 97;
var atk = 107;
var def = 101;
var spatk = 127;
var spdef = 89;
var spd = 79;
b = Buffer.alloc(s, 512, 1, {arg buf; buf.sine1Msg(1.0/[1,2,3,4,5,6,7,8,9,10])});
Mix.ar(
[
SinOsc.ar(hp, mul: max(0, LFNoise1.kr(12))),//hp
SinOsc.ar(atk, mul: max(0, LFNoise1.kr(12)))*2,//atk
SinOsc.ar(def, mul: max(0, LFNoise1.kr(12)))*3,//def
SinOsc.ar(spatk, mul: max(0, LFNoise1.kr(12)))*4,//spatk
SinOsc.ar(spdef, mul: max(0, LFNoise1.kr(12)))*5,//spdef
SinOsc.ar(spd, mul: max(0, LFNoise1.kr(12)))*6,//spd
			// Blip.ar(pokedexNum,200,1.0,0.0),//bug
			// COsc.ar(b.bufnum, 200, 0.7, 0.25),//ground
			// DynKlank.ar(`[[800, 1071, 1153, 1723], nil, [1, 1, 1, 1]], Impulse.ar(2, 0, 0.1)),//steel
			// DynKlank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar([0.007, 0.007])), //ghost
			//FSinOsc.ar(FSinOsc.ar(XLine.kr(4, 401, 8), 0.0, 200, 800)) * 0.2,//dark
			// Formant.ar(XLine.kr(400,1000, 8), 2000, 800, 0.125),//fire
			// LFCub.ar(LFCub.kr(LFCub.kr(0.2,0,8,10),0, 400,800),0,0.1),//poison
			// LFGauss.ar(MouseX.kr(1, 0.001, 1), 0.1) * SinOsc.ar(pokedexNum) * 0.1,//ice
			// SinOsc.ar(pokedexNum, 0, 1),//normal
			// Pulse.ar(pokedexNum, SinOsc.kr(0.2).range(0.01, 0.99), 0.3),//rock
			// Klank.ar([ // fighting
			// 	`[[500, 1078, 1200, 1700], nil, [1, 1, 1, 1]], // left channel
			// 	`[[700, 1071, 1053, 1800], nil, [1, 1, 1, 1]] // right channel
			// ], Impulse.ar([2, 2.25], 0, 0.1)),
			FSinOsc.ar(pokedexNum,0,1,0)*0.3,//psychic
			// Blip.ar(freq: pokedexNum, numharm: 1, mul: 1.0, add: 0.0), //water
			// Saw.ar(freq: pokedexNum, mul: 0.5, add: 1.0), // electric
			// PSinGrain.ar( pokedexNum, 10, 0.1)*0.3,//grass
			//Saw.ar(freq: pokedexNum, mul: 5.0, add: 0.0),//dragon
			// //fairy
			// (
			// 	fork {
			// 		loop {
			// 			play {
			// 				var mod = SinOsc.kr(Rand(0.1, 0.9), 0, Rand(5, 50));
			// 				Pan2.ar(DynKlang.ar(`[ Array.rand(1, 10, 2000), 1, mod ]), 10.0.rand)
			// 				* EnvGen.kr(Env.sine(2), 1, 0.05, doneAction: Done.freeSelf)
			// 			};
			// 			1.wait;
			// 		}
			// 	}
			// )
]
)*0.3
}.play
)

//
//
//
// //types?
// //bug
// (
// {
// 	Blip.ar(freq: 440.0, numharm: 200.0, mul: 1.0, add: 0.0)
// }.play
// )
// //ground
// (
// b = Buffer.alloc(s, 512, 1, {arg buf; buf.sine1Msg(1.0/[1,2,3,4,5,6,7,8,9,10])});
// { COsc.ar(b.bufnum, 200, 0.7, 0.25) }.play;
// )
// //steel
// { DynKlank.ar(`[[800, 1071, 1153, 1723], nil, [1, 1, 1, 1]], Impulse.ar(2, 0, 0.1)) }.play;
// //ghost
// { DynKlank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar([0.007, 0.007])) }.play;
// //dark
// { FSinOsc.ar(FSinOsc.ar(XLine.kr(4, 401, 8), 0.0, 200, 800)) * 0.2 }.play;
// //fire
// { Formant.ar(XLine.kr(400,1000, 8), 2000, 800, 0.125) }.play
// //poison
// { LFCub.ar(LFCub.kr(LFCub.kr(0.2,0,8,10),0, 400,800),0,0.1) }.play
// //ice
// { LFGauss.ar(MouseX.kr(1, 0.001, 1), 0.1) * SinOsc.ar(1000) * 0.1 }.play;
// // Normal:
// { SinOsc.ar(200, 0, 1) }.play;
// // Rock:
// { Pulse.ar(50, SinOsc.kr(0.2).range(0.01, 0.99), 0.3) }.play;
// //fighting
// (
// {
// 	Klank.ar([ // the multichannel-expansion
// 		`[[500, 1078, 1200, 1700], nil, [1, 1, 1, 1]], // left channel
// 		`[[700, 1071, 1053, 1800], nil, [1, 1, 1, 1]] // right channel
// 	], Impulse.ar([2, 2.25], 0, 0.1))
// }.play
// );
// //psychic
// (
// {
// 	FSinOsc.ar(799,0,1,0)*0.3
// }.play;
// )​
// //water
// Blip.ar(freq: 200, numharm: 1, mul: 1.0, add: 0.0)
// //electric
// Saw.ar(freq: 100, mul: 0.5, add: 1.0) // electric