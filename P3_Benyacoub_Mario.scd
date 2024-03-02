// benyacoub mario.exe
//based on yotamorimoto self-destructing digital tape loop



b = Buffer.read(s, "C:/Users/Zaid Benyacoub/Downloads/Super_Mario_Bros_Underground_Theme.aiff");
(
{
	var trig, rate, pos, sig, rec;
	trig = Saw.ar(440.0,2,3);//added parameters for mul and add
	rate = TChoose.kr(trig, [-20, 10, 20, -30, -7.5]);//multiplied all values in table by 10
	pos = TRand.ar(0,BufFrames.ir(b), trig);
	sig = PlayBuf.ar(2, b, loop: 2);//changed loop to 2
	rec = Phasor.ar(trig, K2A.ar(rate), 0, BufFrames.ir(b), pos);
	BufWr.ar(sig, b, rec);
	sig
}.play;
)
b.free;