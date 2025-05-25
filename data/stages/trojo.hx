import openfl.system.Capabilities;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.effects.FlxTrail;
import openfl.display.BlendMode;
var time:Float = 0;
function postCreate(){	
    grade.screenCenter();
    grade.camera=camOther2;
	grade.alpha=0;
	code.visible = false;
    foreskin2.visible = false;
	window.visible = window2.visible = window3.visible = false;
	foreskinpix.visible=false;
	windowhud.visible = windowhud2.visible = windowhud3.visible = false;
	windowhud.camera = windowhud2.camera = windowhud3.camera = camOther2;
	bgbleffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
	bgbleffect.updateHitbox();
	bgbleffect.antialiasing = true;
	bgbleffect.screenCenter();
	bgbleffect.scrollFactor.set();
	bgbleffect.alpha = 0.5;
	add(bgbleffect);
	fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
	fx.setGraphicSize(Std.int(2560 * 0.75));
	fx.updateHitbox();
	fx.antialiasing = true;
	fx.screenCenter();
	fx.scrollFactor.set(0, 0);
	fx.alpha = 0.3;		
	windowhud.camera=camOther2;
	windowhud2.camera=camOther2;
	windowhud3.camera=camOther2;
}
function beatHit(curBeat)
{			
	if (curBeat == 12)
	{
		FlxTween.tween(dead, {alpha: 0.9}, 1, {ease: FlxEase.linear});
	}
	if (curBeat == 16)
	{
		FlxTween.tween(dead, {alpha: 0}, 2, {ease: FlxEase.linear});
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 4, {ease: FlxEase.cubeInOut});
		defaultCamZoom = 0.9;
	}
	if (curBeat == 27)
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1.6, {ease: FlxEase.cubeOut});
		defaultCamZoom = 1.1;
	}
	if (curBeat == 28)
	{
		FlxTween.tween(camHUD, {zoom: 1}, 1.3, {ease: FlxEase.cubeOut});
		FlxTween.tween(camHUD, {alpha: 1}, 1.3, {ease: FlxEase.cubeOut});
	}
	if (curBeat == 64)
	{
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 0.9;
	}
	if (curBeat == 102)
	{
	FlxTween.tween(FlxG.camera, {zoom: 1.1}, 0.5, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 1.1;
	}
	if (curBeat == 104)
	{
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 0.9;
	}
	if (curBeat == 128)
	{
	FlxTween.tween(grade, {alpha: 0.5}, 1, {ease: FlxEase.cubeOut});
	FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 1.1;
	}
	if (curBeat == 192)
	{
	FlxTween.tween(FlxG.camera, {angle: 10}, 2, {ease: FlxEase.cubeInOut});
	FlxTween.tween(grade, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
	FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 1.2;
	}
	if (curBeat == 256) {
		FlxTween.tween(grade, {alpha: 0}, 1, {ease: FlxEase.cubeOut});
    }
	if ((curBeat == 316))
	{
		defaultCamZoom = 1.3;
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, 1.32, {ease: FlxEase.cubeIn});
	}
	if (curBeat == 320)
	{
		code.visible = true;
		window.visible = true;
		window2.visible = true;
		window3.visible = true;
		foreskin2.visible = true;
		window3.angle -= 20 * Math.sin((curBeat*0.37));
		window3.y = 150 - 500  * Math.sin(curBeat*0.59);
		window3.x = 0 - 600  * Math.sin(curBeat*0.53);
		windowhud.visible=windowhud2.visible=windowhud3.visible=foreskin2.visible=true;
		behind.alpha=behind2.alpha=behind3.alpha=foreskin.alpha=bucket.alpha=0;
	}
}
public function alpha_shit(){
	foreskinpix.visible = !foreskinpix.visible;
	foreskin.visible = !foreskin.visible;
}

//WINDOW_SHIT_PLEASE_KILL_ME.

function postUpdate(elapsed:Float) {
	var currentBeat2:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/170);

	window.angle=0 - 20 * Math.cos((currentBeat2*0.59)*Math.PI);
    window2.angle=0 - 20 * Math.cos((currentBeat2*0.43)*Math.PI);
    window3.angle=0 - 20 * Math.cos((currentBeat2*0.37)*Math.PI);
    windowhud.angle=0 - 20 * Math.cos((currentBeat2*0.53)*Math.PI);
    windowhud2.angle=0 - 20 * Math.cos((currentBeat2*0.47)*Math.PI);
    windowhud3.angle=0 - 20 * Math.cos((currentBeat2*0.39)*Math.PI);
	if (curBeat < 448){
        window.y=150 - 300 * Math.cos((currentBeat2*0.43)*Math.PI);
        window2.y=150 - 400 * Math.cos((currentBeat2*0.37)*Math.PI);
        window3.y=150 - 500 * Math.cos((currentBeat2*0.59)*Math.PI);
        windowhud.y=0 - 600 * Math.cos((currentBeat2*0.47)*Math.PI);
        windowhud2.y=0 - 600 * Math.cos((currentBeat2*0.39)*Math.PI);
        windowhud3.y=0 - 600 * Math.cos((currentBeat2*0.53)*Math.PI);

        window.x=window.x + 10;
        window2.x=window2.x + 7;
        window3.x=window3.x+ 13;
        windowhud.x= windowhud.x - 10;
        windowhud2.x= windowhud2.x - 12;
        windowhud3.x= windowhud3.x - 14;

        if (window.x >= 2000) {
            window.x= -1000;
        }
        if (window2.x >= 2000){
            window2.x= -1000;
        }
        if (window3.x >= 2000){
            window3.x= -1000;
        }
        if (windowhud.x <= -1200) {
            windowhud.x= 1600;
        }
        if (windowhud2.x <= -1200){
            windowhud2.x= 1600;
        }
        if (windowhud3.x <= -1200) {
            windowhud3.x= 1600;
        }
    }
	 if (curBeat == 448) {
        
		FlxTween.tween(windowhud, {y: windowhud.y - 50}, 0.25,{ ease: FlxEase.cubeOut, onComplete: function(twn:FlxTween) {windowbounce();}});
        FlxTween.tween(windowhud2, {y: windowhud2.y -50}, 0.25,{ ease: FlxEase.cubeOut});
        FlxTween.tween(windowhud3, {y: windowhud3.y -50}, 0.25,{ ease: FlxEase.cubeOut});
        FlxTween.tween(window, {y: window.y -50}, 0.25,{ ease: FlxEase.cubeOut});
        FlxTween.tween(window2, {y: window2.y -50}, 0.25,{ ease: FlxEase.cubeOut});
        FlxTween.tween(window3, {y: window3.y -50}, 0.25,{ ease: FlxEase.cubeOut});
    }
}
function windowbounce(){
	FlxTween.tween(windowhud, {y: windowhud.y + 1500}, 1,{ ease: FlxEase.cubeIn, onComplete: function(twn:FlxTween) {windowbounce();}});
	FlxTween.tween(windowhud2, {y: windowhud2.y + 1500}, 1,{ ease: FlxEase.cubeIn});
	FlxTween.tween(windowhud3, {y: windowhud3.y + 1500}, 1,{ ease: FlxEase.cubeIn});
	FlxTween.tween(window, {y: window.y + 1500}, 1,{ ease: FlxEase.cubeIn});
	FlxTween.tween(window2, {y: window2.y + 1500}, 1,{ ease: FlxEase.cubeIn});
	FlxTween.tween(window3, {y: window3.y + 1500}, 1,{ ease: FlxEase.cubeIn});
}