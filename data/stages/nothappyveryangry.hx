import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var hudAngle:Bool = false;
var time:Float = 0;
override function update(elapsed:Float){time += elapsed;
if (hudAngle)
	{
		FlxG.camera.angle = -10 * Math.sin((time/2) * Math.PI);
		camHUD.angle = -15 * Math.sin((time/2) * Math.PI);
	}
}
function postCreate() {
	lavad.alpha = 0;
	pentad.angle = -360;
	pentadalt.angle = -360;
	pentadalt.alpha = 0;
	bgbackwater.alpha = 0;
	bgmiddwater.alpha = 0;
	fored2.alpha = 0;
	particle.cameras = [camGame];
	particle.angle = 180;
	particle.alpha = 0;
	screencum.cameras = [camHUD];
	screencum.screenCenter();
	screencum.alpha = 0;
	deadly1.cameras = [camHUD];
	deadly1.alpha = 0;
	deadly2.cameras = [camHUD];
	deadly2.alpha = 0;
	dead.cameras = [camHUD];
	alive.cameras = [camHUD];
	alive.alpha = 0;
}

function onDadHit(e){
}
function onSongStart() {
	FlxTween.tween(dead, {alpha: 0}, 16.94);
}
function beatHit(curBeat)
{			
	if ((curBeat >= 180) && (curBeat < 243))
	{
		FlxTween.tween(camHUD, {zoom: 1}, 0.25, {ease: FlxEase.circOut});
//		triggerEvent('Add Camera Zoom', 0.1, 0)
		camHUD.zoom = 1.3;
	}
	if ((curBeat >= 504) && (curBeat < 571))
	{
		FlxTween.tween(camHUD, {zoom: 1}, 0.25, {ease: FlxEase.circOut});
//		triggerEvent('Add Camera Zoom', 0.1, 0)
		camHUD.zoom = 1.3;
	}
	if ((curBeat == 110))
	{ 
		FlxTween.tween(pentad, {y: -700}, 1, {ease: FlxEase.circOut});
		FlxTween.tween(pentad, {angle: 0}, 1, {ease: FlxEase.circOut});
	}	
	if ((curBeat == 112))
	{ 
		FlxTween.tween(alive, {alpha: 0}, 0.5);
		alive.alpha = 1;
	}	
	if ((curBeat == 178))
	{ 
		FlxTween.tween(camGame, {angle: -360}, 1, {ease: FlxEase.circIn});
		FlxTween.tween(camGame, {zoom: 1.5}, 0.75, {ease: FlxEase.circIn});
	}	
	if ((curBeat == 180))
	{ 
		hudAngle = true;
		FlxG.sound.play(Paths.sound('fanmade/alyxs_stuff/coom'), 1);
		FlxTween.tween(particle, {alpha: 1}, 0.5);
		dad.y = -500;
		boyfriend.y = -400;
		bgbackd.alpha = 0;
		bgmidd.alpha = 0;
		bgfrontd.alpha = 0;
		fored.alpha = 0;
		lavad.alpha = 1;
		cameraSpeed = 4;
		screencum.alpha = 0.6;
	}	
	if ((curBeat == 236))
	{ 
		FlxTween.tween(dad, {y: 250}, 4, {ease: FlxEase.bouceOut});
		FlxTween.tween(boyfriend, {y: 450}, 4, {ease: FlxEase.bounceOut});
		fored2.alpha = 1;
	}	
	if ((curBeat == 244))
	{ 
		FlxTween.tween(camHUD, {angle: 0}, 0.5, {ease: FlxEase.circOut});
		hudAngle = false;
		FlxTween.tween(particle, {alpha: 0}, 0.5);
		FlxTween.tween(alive, {alpha: 0}, 0.5);
		cameraSpeed = 2;
		alive.alpha = 1;
		boyfriend.angle = 0;

	}	
}
function stepHit(curStep)
{
}
			