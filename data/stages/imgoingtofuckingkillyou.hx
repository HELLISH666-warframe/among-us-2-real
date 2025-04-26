import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var bloodshedTrail = null;
var boom:FlxSound;
var time:Float = 0;
var hudAngle:Bool = false;
boom = FlxG.sound.load(Paths.sound("fanmade/alyxs_stuff/boom"));
var googoo:FlxSprite = new FlxSprite();
googoo.cameras = [camHUD];
googoo.frames = Paths.getSparrowAtlas('stages/fan-made_stuff/alyxs_stuff/giggad/googoo');
googoo.scrollFactor.set(1, 1);
googoo.animation.addByPrefix('googoogaga', 'googoogaga', 4, true);
googoo.animation.play('googoogaga');
googoo.updateHitbox();
googoo.screenCenter();
add(googoo);
googoo.alpha = 0;
var cutoffPP:FlxSprite = new FlxSprite(-250, -250);
cutoffPP.cameras = [camHUD];
cutoffPP.frames = Paths.getSparrowAtlas('characters/fanmade_stuff/alyxs_stuff/cutoffPP');
cutoffPP.scrollFactor.set(0, 0);
cutoffPP.animation.addByPrefix('cutoffPP', 'cutoffPP', 18, false);
cutoffPP.updateHitbox();
cutoffPP.alpha = 0;
cutoffPP.x = -400;
cutoffPP.y = -400;
var chromAbEffect:CustomShader  = new CustomShader("fanmade_stuff/alyxs_stuff/ChromAbEffect");
var greyScale:CustomShader  = new CustomShader("fanmade_stuff/alyxs_stuff/greyScale");
override function update(elapsed:Float){time += elapsed;
	if (hudAngle)
	{
		FlxG.camera.angle = -10 * Math.sin((time/1) * Math.PI);
		camHUD.angle = -15 * Math.sin((time/1) * Math.PI);
	}
	canvas.y = boyfriend.y - 100;
	stone1.x = boyfriend.x - 800;
	stone2.x = boyfriend.x - 500;
	stone3.x = boyfriend.x - 100;
	stone1.y = boyfriend.y + 150;
	stone2.y = boyfriend.y + 350;
	stone3.y = boyfriend.y + 100;
	stone1.angle = stone1.angle - 0.05;
	stone2.angle = stone2.angle + 0.066;
	stone3.angle = stone3.angle - 0.058;
	noskin.y = boyfriend.y - 850;
	noskin.x = boyfriend.x - 1850;
	hind.y = boyfriend.y - 800;

}
function postCreate() {
	FlxG.camera.addShader(greyScale);
camHUD.addShader(greyScale);
	backcity.screenCenter('x');
	sadmoon.screenCenter('x');
	kamehameha.screenCenter('x');
	kamehameha.alpha = 0;
	penty.screenCenter('x');
	frontcity.screenCenter('x');
	backhill.screenCenter('x');
	fronthill.screenCenter('x');
	hind.screenCenter('x');
	hind.visible = false;
	foreskin.screenCenter('x');
	foreskin.alpha = 0;
	foreskinclean.screenCenter('x');
	noskin.screenCenter('x');
	noskin.alpha = 0;
//	canvasclean.alpha = 1;
//	bg.alpha = 0;
	island.screenCenter('x');
	island.alpha = 0;
	island2.screenCenter('x');
	island2.alpha = 0;
	stone1.alpha = 0;
	stone2.alpha = 0;
	stone3.alpha = 0;
	deadly1.visible = false;
	deadly2.visible = false;
	grade.cameras = [camHUD];
	alive.cameras = [camHUD];
	alive.alpha = 0;
	alivefake.cameras = [camHUD];
	alivefake.visible = false;
	deadfake.cameras = [camHUD];
	deadfake.visible = false;
	deadfake.screenCenter();
	dead.cameras = [camHUD];
	dead.alpha = 0.25;
	dead.screenCenter();
	canvas.alpha = 0;
	camHUD.alpha = 0;
	var rainbTmr = new FlxTimer().start(0.06, function(tmr:FlxTimer)        {
		kamehameha.y =  250;
	});
}
function resettrial(){		
	remove(bloodshedTrail);
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	insert(members.indexOf(dad)-1, bloodshedTrail);
}
function onDadHit(e){
	if (curBeat >= 40)
	{    				
		FlxG.camera.shake(0.00125, 0.05);
        camHUD.shake(0.000625, 0.05);
	}
}
function onSongStart() {
	FlxTween.tween(camHUD, {alpha: 1}, 0.5);
	FlxTween.tween(dead, {alpha: 0.5}, 3);
}
function beatHit(curBeat)
{			
	if ((curBeat == 32))
	{ 
	FlxTween.color(pentycanvas, {x: 3}, 1.5,{ease: FlxEase.quadInOut});
	FlxTween.color(pentycanvas, {color: 0xFFFFFFFF}, 3.5,{ease: FlxEase.linear});
	FlxTween.tween(dead, {alpha: 1}, 0.5, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 0.4}, 1.75, {ease: FlxEase.quadInOut});
	}
	if ((curBeat == 35))
	{ 
		add(cutoffPP);
		cutoffPP.alpha = 1;
		cutoffPP.animation.play('cutoffPP');
	}
	if ((curBeat == 36))
	{ 
	FlxTween.tween(pentycanvas, {angle: -720}, 1.25, {ease: FlxEase.quadIn});
	FlxTween.tween(pentycanvas, {y: -5000}, 1.25, {ease: FlxEase.quadIn});
	FlxTween.tween(grade, {alpha: 0}, 1.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(alive, {alpha: 0.4}, 1, {ease: FlxEase.quadIn});
	FlxTween.tween(FlxG.camera, {zoom: 0.4}, 1.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.4;
	cameraSpeed = 4;
	FlxTween.angle(penty, 0, 359.99, 0.33, { type: FlxTween.LOOPING } );
	}
	if ((curBeat == 37))
	{ 
	cameraSpeed = 0.6;
	}
	if ((curBeat == 38))
	{ 
	FlxTween.tween(penty, {y: -1500}, 0.75, {ease: FlxEase.quadOut});
	}
	if (curBeat >= 40)
	{    				
		FlxG.camera.shake(0.00125, 0.05);
		camHUD.shake(0.000625, 0.05);
	}
	if ((curBeat == 40))
	{     
	FlxTween.tween(alive, {alpha: 0}, 1, {ease: FlxEase.quadOut});
	cameraSpeed = 1;
	alive.alpha = 1;
	dead.alpha = 0;
	FlxG.camera.addShader(chromAbEffect);
	camHUD.addShader(chromAbEffect);
	chromAbEffect.data.strength.value = [0.005];
	remove(cutoffPP);
	}
	if ((curBeat == 72))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.5}, 1.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.5;
	}
	if ((curBeat >= 72) && (curBeat < 103))
	{
		if ((curStep % 16 == 0))
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.075;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 35;
		}
	}
	if ((curBeat == 103))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.5, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.9;
	}
	if ((curBeat == 104))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.3}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {angle: 180}, 5.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(boyfriend, {y: -11800}, 1.5, {ease: FlxEase.quadIn});
	FlxTween.tween(dad, {y: -12000}, 1.5, {ease: FlxEase.quadIn});
	FlxTween.tween(canvasclean, {y: -3750}, 1.25, {ease: FlxEase.quadIn});
	FlxTween.tween(canvasclean, {y: -7750}, 1.25, {ease: FlxEase.quadIn});
	FlxTween.tween(boyfriend, {angle: 360}, 1, {ease: FlxEase.quadIn});
	FlxTween.tween(alivefake, {alpha: 1}, 1, {ease: FlxEase.quadIn});
	FlxTween.tween(scoreTxt, {alpha: 0}, 1.25, {ease: FlxEase.quadIn});
//	FlxTween.tween(combo, {alpha: 0}, 1.25, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 108))
	{  
	hudAngle = true;
	FlxG.sound.play(Paths.sound('fanmade/alyxs_stuff/boom'), 0.4);
	stone1.alpha = 0;
	stone2.alpha = 0;
	stone3.alpha = 0;
	canvasclean.alpha = 0;
	foreskinclean.alpha = 0;
	canvas.alpha = 1;
	foreskin.alpha = 1;
	pentycanvas.alpha = 0;
	googoo.alpha = 0.7;
	kamehameha.alpha = 1;
	defaultCamZoom = 1.2;
	cameraSpeed = 2;
	tree1.scale.set(0.4, 0.4);
	tree2.scale.set(0.4, 0.4);
	tree3.scale.set(0.4, 0.4);
	tree4.scale.set(0.4, 0.4);
	FlxTween.tween(camHUD, {alpha: 1}, 0.75, {ease: FlxEase.quadOut});
	FlxG.camera.angle = 0;
	FlxTween.tween(building1, {y: -4800}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(building2, {y: -4600}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(building3, {x: -5000}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree4, {y: -5800}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree3, {x: -100}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree4, {x: 800}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {angle: 25}, 5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 5, {ease: FlxEase.linear});
	FlxTween.tween(tree3, {y: -6000}, 3.5, {ease: FlxEase.quadOut});
	FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadIn});
	dad.y -= 12000;
	}
	if ((curBeat == 123))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.6;
	}
	if ((curBeat == 124))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 1.2}, 5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {angle: -25}, 5, {ease: FlxEase.linear});
	defaultCamZoom = 1.2;
	}
	if ((curBeat == 139))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.6;
	}
	if ((curBeat == 140))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 1}, 5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {angle: 25}, 5, {ease: FlxEase.linear});
	defaultCamZoom = 1.2;
	}
	if ((curBeat == 155))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.6;
	}
	if ((curBeat == 156))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 5.5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {angle: -180}, 5.5, {ease: FlxEase.linear});
	FlxTween.tween(boyfriend, {y: -5825}, 5.5, {ease: FlxEase.quadIn});
	FlxTween.tween(dad, {y: -6000}, 5.5, {ease: FlxEase.quadIn});
	FlxTween.tween(penty, {y: -2750}, 5.5, {ease: FlxEase.quadIn});
	FlxTween.tween(tree1, {y: -4700}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree2, {y: -4200}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree3, {y: -4500}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(tree4, {y: -4300}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(building1, {y: -3000}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(building2, {y: -2700}, 7.5, {ease: FlxEase.quadOut});
	FlxTween.tween(building3, {x: -4000}, 7.5, {ease: FlxEase.quadOut});
	cameraSpeed = 0.6;
	defaultCamZoom = 0.9;
	}
	if ((curBeat == 168))
	{     
	FlxTween.tween(alive, {alpha: 1}, 1, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 172))
	{     
	hudAngle = false;
	FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 1.5, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.6;
	FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
	FlxTween.tween(alive, {alpha: 0}, 1.25, {ease: FlxEase.quadOut});
	cameraSpeed = 1;
	boyfriend.angle = 0;
	island.alpha = 1;
	island2.alpha = 1;
//	camGame.alpha = 0;
	googoo.alpha = 0.4;
	alivefake.alpha = 1;
	dad.angle = 0;
	dad.y = -6000;
	}
	if ((curBeat == 176))
	{     
		hudAngle = true;
	}
	if ((curBeat == 218))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1.5, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.9;
	FlxTween.tween(grade, {alpha: 1}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(dead, {alpha: 0.25}, 1.25, {ease: FlxEase.quadInOut});
	cameraSpeed = 0.6;
	FlxTween.tween(greyScale.data, {strength: 1}, 0.75, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 234))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.6;
	FlxTween.tween(grade, {alpha: 0}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(dead, {alpha: 0}, 1.25, {ease: FlxEase.quadInOut});
	cameraSpeed = 1;
	FlxTween.tween(greyScale.data, {strength: 0}, 0.75, {ease: FlxEase.quadOut});
	}
	if ((curBeat == 251))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.7;
	}
	if ((curBeat == 267))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.6;
	}
	if ((curBeat == 283))
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.7;
	}
	if ((curBeat == 300))
	{     
	hudAngle = false;
	FlxTween.tween(camHUD, {angle: 0}, 3, {ease: FlxEase.quadOut});
	FlxTween.tween(camHUD, {x: 0}, 3, {ease: FlxEase.quadOut});
	FlxTween.tween(camHUD, {y: 0}, 3, {ease: FlxEase.quadOut});
	FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
	FlxTween.tween(grade, {alpha: 1}, 0.75, {ease: FlxEase.quadOut});
	FlxTween.tween(dead, {alpha: 0.75}, 0.75, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {angle: -10}, 0.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 0.4}, 2.5, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.4;
	alivefake.alpha = 1;
	}
	if ((curBeat == 308))
	{     
	FlxTween.tween(alivefake, {alpha: 1}, 2.75, {ease: FlxEase.quadIn});
	FlxTween.tween(dead, {alpha: 0.25}, 0.75, {ease: FlxEase.quadIn});
	FlxTween.tween(FlxG.camera, {angle: 15}, 2.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 2.5, {ease: FlxEase.quadIn});
	defaultCamZoom = 1;
	cameraSpeed = 0.6;
	FlxTween.tween(greyScale.data, {strength: 0.5}, 3, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 316))
	{     
	FlxTween.tween(alivefake, {alpha: 0}, 0.5, {ease: FlxEase.quadOut});
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.75, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.9;
	hind.alpha = 1;
	noskin.alpha = 1;
	canvas.alpha = 0;
	}
	if ((curBeat == 343))
	{     
	FlxTween.tween(FlxG.camera, {angle: 0}, 1.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 1;
	}
	if ((curBeat == 347))
	{     
	FlxTween.tween(FlxG.camera, {angle: -15}, 2.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 0.9;
	}
	if ((curBeat == 376))
	{     
	FlxTween.tween(FlxG.camera, {angle: 0}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 1.75, {ease: FlxEase.quadInOut});
	defaultCamZoom = 1;
	}
	if ((curBeat == 380))
	{     
	FlxG.camera.shake(0.005, 0.75);
    camHUD.shake(0.0025, 0.75);
	FlxTween.tween(FlxG.camera, {zoom: 0.8}, 1.75, {ease: FlxEase.quadOut});
	defaultCamZoom = 0.8;
	FlxTween.tween(hind, {alpha: 0.5}, 0.5, {ease: FlxEase.quadOut});
	FlxTween.tween(noskin, {alpha: 0.5}, 0.5, {ease: FlxEase.quadOut});
	}
	if ((curBeat == 381))
	{     
	FlxTween.tween(hind, {alpha: 1}, 0.5, {ease: FlxEase.quadIn});
	FlxTween.tween(noskin, {alpha: 1}, 0.5, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 1))
	{     
	greyScale.data.strength = [0];
	}
	if ((curBeat <= 464))
	{     
	island.x = dad.x - 100;
	island.y = dad.y + 700;
	island2.x = boyfriend.x + 125;
	island2.y = boyfriend.y + 700;
	}
	if ((curBeat >= 108))
	{     
	tree1.angle = 0 - 13  * Math.sin(curBeat*0.39);
	tree2.angle = 0 - 19  * Math.sin(curBeat*0.22);
	tree3.angle = 0 - 17  * Math.sin(curBeat*0.25);
	tree4.angle = 0 - 15  * Math.sin(curBeat*0.48);
	}
}
function stepHit(curStep)
{
	if (curStep == 161)
	{
	resettrial();
	}
	if (curStep == 433)
	{
	resettrial();
	}
		if ((curStep >= 108) && (curStep < 172))
	{
		dad.angle = 0 - 5  * Math.sin(curStep*0.25);
//		dad.angle = 0 - 5  * Math.sin(curBeat*0.25);
  //      setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 0.5)
  		FlxG.camera.shake(0.0075, 0.05);
        camHUD.shake(0.004, 0.05);
	}
	if ((curStep >= 172) && (curStep < 220))
	{
	FlxG.camera.shake(0.0025, 0.05);
	camHUD.shake(0.001, 0.05);
	}
	if ((curStep >= 220) && (curStep < 234))
	{
	FlxG.camera.shake(0.00125, 0.05);
	camHUD.shake(0.0005, 0.05);
	}
	if ((curStep >= 234) && (curStep < 300))
	{
	FlxG.camera.shake(0.0025, 0.05);
	camHUD.shake(0.001, 0.05);
	}
	if ((curStep >= 300) && (curStep < 444))
	{
	FlxG.camera.shake(0.000625, 0.05);
	camHUD.shake(0.00025, 0.05);
	}
	if ((curStep >= 448) && (curStep < 480))
	{
	FlxG.camera.shake(0.005, 0.05);
	camHUD.shake(0.002, 0.05);
	}
	if ((curStep >= 480) && (curStep < 544))
	{
	dad.angle = 0 - 5  * Math.sin(curBeat*0.25);
//		setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 0.5)
	}
	if ((curStep == 1792))
	{
	FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
	camHUD.angle = 20;
	FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
//     setProperty('camHUD.zoom', 1.15)
	}
	if ((curStep == 1808))
	{
	FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
	camHUD.angle = 20;
	FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
	camHUD.zoom = 1.15;
	FlxTween.tween(FlxG.camera, {angle: -35}, 0.15, {ease: FlxEase.quadIn});
	FlxTween.tween(camHUD, {zoom: 0.7}, 0.25, {ease: FlxEase.bounceOut});
	defaultCamZoom = 0.7;
	}
	if ((curStep == 1824))
	{
	FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
	camHUD.angle = -20;
	FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
	camHUD.zoom = 1.15;
	}
	if ((curStep == 1832))
	{
	FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
	camHUD.angle =-20;
	FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
	camHUD.zoom = 1.15;
	}
	if ((curStep < 1293))
	{     
	canvas.angle = 0 - 18  * Math.sin((curStep*0.36));
	}
}
			