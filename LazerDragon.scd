(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1),
	freq=500, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig = Pulse.ar(freq,MouseX.kr(0.0,1.0));
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out,sig);
}).add;
Synth(\bpfsaw);
)


s.plotTree;
Quarks.gui;
thisProcess.recompile;
s.boot;
k=KeyboardWindow();

// GUI
(
var main_window, pwm_knob, pwm_label, enable_synth,
screen_width, screen_height, window_width, window_height;
Window.closeAll;
screen_width = Window.screenBounds.width;
screen_height = Window.screenBounds.height;
window_width = 960;
window_height = 540;
//screen_width
//screen_height
main_window = Window.new("LazerDragon v0.01", Rect(100,screen_height - window_height,960,540)).front;
main_window.alwaysOnTop_(True);
enable_synth = Button(main_window, Rect(10,10,100,30)).states_([
    ["Enable",Color.new(0.0,0.0,0.0,1.0),Color.new(0.0,1.0,0.0,1.0)],
    ["Disable",Color.new(0.0,0.0,0.0,1.0),Color.new(1.0,0.0,0.0,1.0)]
]);
pwm_knob = Knob(main_window, Rect(10, 100, 50, 50))
    .background_(Color.new(0.5,0.0,0.0,1.0));
pwm_label = StaticText.new(main_window,Rect(20,70,100,30)).string_("PWM");
)





