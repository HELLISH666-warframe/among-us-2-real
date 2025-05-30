import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var hudAngle:Bool = false;
var time:Float = 0;
var owo = 0;
var owo2 = 0;
var owo3 = 0.5;
var uwu = 0.015;
var funni = 0.05;

function update(elapsed:Float){
    var currentBeat2:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/170);

    pentad.angle=pentad.angle-funni;
    
    particle.y=particle.y=10;

    if (lavad.y >= -2000){
        lavad.y=-4000;
    }
    if (particle.y <= -5000){
        particle.y=-50;
    }

    if (curBeat >= 110){
        if (health > 1.6){
            owo = 0.1;
            owo2 = 0.2;
        }
        if ((health <= 1.6) && (health > 1.2)){
            owo = 0.3;
            owo2 = 0.4;
        }
        if ((health <= 1.2) && (health > 0.8)){
            owo = 0.5;
            owo2 = 0.6;
        }
        if ((health <= 0.8) && (health > 0.4)){
            owo = 0.7;
            owo2 = 0.8;
        }
        if (health <= 0.4){
            owo = 0.9;
            owo2 = 1;
        }
    }

    if (curBeat >= 572){
        FlxG.camera.shake(0.24, 0.05);
        camHUD.shake(0.12, 0.05);
    if (curBeat >= 112){
        if (health > 0.05){
            health - 0.0075;
        }
    }
}

    if ((curBeat >= 176) && (curBeat <= 180)){
        if (funni < 2.5) {
            funni = funni + 0.01;
        }
    }

    if ((curBeat >= 244) && (curBeat <= 248)){
        if (funni > 0.5) {
            funni = funni - 0.01;
        }
    }
    if ((curBeat >= 312) && (curBeat <= 316)) {
        if (funni > 0.05) {
            funni = funni - 0.01;
        }
    }
    if ((curBeat >= 502) && (curBeat <= 508)) {
        if (funni < 5) {
            funni = funni + 0.01;
        }
    }
    if ((curBeat >= 572) && (curBeat <= 576)) {
        if (funni > 0.05) {
            funni = funni - 0.01;
        }
    }
    if ((curBeat >= 180) && (curBeat < 244)) {        
        FlxG.camera.shake(0.0128, 0.05);
        camHUD.shake(0.0032, 0.05);
        boyfriend.angle=boyfriend.angle+1;
    }
    if ((curBeat >= 504) && (curBeat < 580)) {
        FlxG.camera.shake(0.0128, 0.05);
        camHUD.shake(0.0032, 0.05);
        boyfriend.angle=boyfriend.angle+1;
    }
    if (hudAngle) {
        FlxG.camera.angle=0- -10 *  Math.cos((currentBeat2*0.25)*Math.PI);
        camHUD.angle=0- -15 *  Math.cos((currentBeat2*0.5)*Math.PI);
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
	screencum.camera = camOther2;
	screencum.screenCenter();
	screencum.alpha = 0;
	deadly1.camera = camOther2;
	deadly1.alpha = 0;
	deadly2.cameras = camOther2;
	deadly2.alpha = 0;
	dead.cameras = camOther2;
	alive.cameras = camOther2;
	alive.alpha = 0;
}

function onDadHit(e){
}
function onSongStart() {
	FlxTween.tween(dead, {alpha: 0}, 0.94);
}
function beatHit(curBeat)
{			
	if ((curBeat >= 180) && (curBeat < 243))
	{
		FlxTween.tween(camHUD, {zoom: 1}, 0.25, {ease: FlxEase.circOut});
		camHUD.zoom = 1.3;
	}
	if ((curBeat >= 504) && (curBeat < 571))
	{
		FlxTween.tween(camHUD, {zoom: 1}, 0.25, {ease: FlxEase.circOut});
		camHUD.zoom = 1.3;
	}
	if (curBeat == 110) {
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
	if (curBeat == 180) {
        uwu = 0.03;
        hudAngle = true;
        FlxG.sound.play(Paths.sound('fanmade/alyxs_stuff/coom'),1);
        //FlxTween.tween(bg, {alpha: 0}, 0.1);
        FlxTween.tween(particle, {alpha: 1}, 0.5);
        dad.y=-500;
        boyfriend.y=-400;
        bgbackd.alpha=0;
        bgmidd.alpha=0;
        bgfrontd.alpha=0;
        fored.alpha=0;
        lavad.alpha=1;
        scoreTxt.alpha=0;
        cameraSpeed=4;
        screencum.alpha=0.6;
    }
	if (curBeat == 236) {
        FlxTween.tween(dad, {y: 250}, 4, {ease: FlxEase.bouceOut});
        FlxTween.tween(boyfriend, {y: 450}, 4, {ease: FlxEase.bouceOut});
        fored2.alpha=1;
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
			