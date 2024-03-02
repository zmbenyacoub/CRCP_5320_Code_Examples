//what im trying to do: have all 26 letters on the keyboard produce a squarewave with an output between 1 and their corresponding keycode
//BlitB3Square doesnt want to be recognised for some reason
play{Mix.ar(BlitB3Square.ar(KeyState.kr(65,0,rrand(1,65),0.2))*BlitB3Square.ar(KeyState.kr(83,0,rrand(1,83),0.2))*BlitB3Square.ar(KeyState.kr(68,0,rrand(1,68),0.2)))}
//changed to regular sine oscillators, but the keystate functions dont want to work
play{Mix.ar(SinOsc.ar(KeyState.kr(65,0,rrand(1,65),0.2))*SinOsc.ar(KeyState.kr(83,0,rrand(1,83),0.2))*SinOsc.ar(KeyState.kr(68,0,rrand(1,68),0.2)))}
  //example code from BlitB3Square documentation
{ BlitB3Square.ar(XLine.kr(1000, 20, 10)) }.play
//removed the random values because i thought that might be the problem, it wasn't
play{Mix.ar(SinOsc.ar(KeyState.kr(65,0.1,1,0.2))*SinOsc.ar(KeyState.kr(83,0.1,1,0.2))*SinOsc.ar(KeyState.kr(68,0.1,1,0.2)))}
//example code for keystate where you can press j to make sound, doesnt recognise 'front', which is supposed to create a gui that is safe to type on
(
w.front; // something safe to type on
{ SinOsc.ar(800, 0, KeyState.kr(38, 0, 0.1)) }.play;
)