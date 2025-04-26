import openfl.system.Capabilities;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.effects.FlxTrail;
import openfl.display.BlendMode;
var grade:FlxSprite;
var hud:Bool = false;
var hudbutnot:Bool = false;
var time:Float = 0;
grade = new FlxSprite().loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/grade'));
grade.scrollFactor.set();
grade.screenCenter();
grade.alpha = 0;
add(grade);
camHUD.zoom = 1.5;
/*var credits:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/credbar'));
credits.updateHitbox();
credits.screenCenter();
credits.scale.set(3.25, 3.25);
credits.active = false;
credits.antialiasing = true;
credits.scrollFactor.set(0.2, 0.2);
var credits2:FlxSprite = new FlxSprite(800,950).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/credits'));
credits2.updateHitbox();
credits2.screenCenter();
credits2.scale.set(2, 2);
credits2.antialiasing = true;
credits2.scrollFactor.set(0.2, 0.2);
var musicianicon:FlxSprite = new FlxSprite(800,950).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/cartman'));
musicianicon.updateHitbox();
musicianicon.screenCenter();
musicianicon.scale.set(0.15, 0.15);
musicianicon.antialiasing = true;
musicianicon.scrollFactor.set(0.2, 0.2);
//	insert(2, graadienter);
function onSongStart() {
	FlxTween.tween(credits, {y: credits.y - 50}, 1.5, {ease: FlxEase.bounceOut});
	FlxTween.tween(credits2, {y: credits2.y - 450}, 1, {ease: FlxEase.cubeOut});
}*/
function postCreate(){	
//	add(credits);
//	add(credits2);
	glitchybg.visible = false;
    windowblock.visible = false;
	window.visible = false;
    window2.visible = false;
	window3.visible = false;
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
}
function update(elapsed:Float) {
if (hud)
	{
		camGame.angle = 0 - 10  * Math.sin((curStep/8) * Math.sin);
	}
if (hudbutnot)
	{
		camHUD.angle = 0 - 5  * Math.sin((curStep/8) * Math.sin);
		camHUD.x = 0 - 25  * Math.sin((curStep/14+0.5) * Math.sin);
		camHUD.y = 0 - 25  * Math.sin((curStep/18+0.25) * Math.sin);
	}
}
function beatHit(curBeat)
{			
	if ((curBeat == 12))
	{
		FlxTween.tween(dead, {alpha: 0.9}, 1, {ease: FlxEase.linear});
	}
	if ((curBeat == 16))
	{
		FlxTween.tween(dead, {alpha: 0}, 2, {ease: FlxEase.linear});
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 4, {ease: FlxEase.cubeInOut});
		defaultCamZoom = 0.9;
	}
	if ((curBeat == 27))
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1.6, {ease: FlxEase.cubeOut});
		defaultCamZoom = 1.1;
	}
	if ((curBeat == 28))
	{
		FlxTween.tween(camHUD, {zoom: 1}, 1.3, {ease: FlxEase.cubeOut});
	}
	if ((curBeat == 64))
	{
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 0.9;
	}
	if ((curBeat == 102))
	{
	FlxTween.tween(FlxG.camera, {zoom: 1.1}, 0.5, {ease: FlxEase.cubeInOut});
	defaultCamZoom = 1.1;
	}
	if ((curBeat == 104))
	{
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.cubeOut});
	defaultCamZoom = 0.9;
	}
	if ((curBeat == 128))
	{
	FlxTween.tween(grade, {alpha: 0.5}, 1, {ease: FlxEase.cubeOut});
	FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1, {ease: FlxEase.cubeOut});
	defaultCamZoom = 1.1;
	hudbutnot = true;
	}
	if ((curBeat == 192))
	{
	FlxTween.tween(grade, {alpha: 1}, 1, {ease: FlxEase.cubeOut});
	FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1, {ease: FlxEase.cubeOut});
	defaultCamZoom = 1.2;
	}
	if ((curBeat == 254))
	{
	FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.33, {ease: FlxEase.cubeOut});
	defaultCamZoom = 0.7;
	}
    if ((curBeat == 312))
    {
		FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.5, {ease: FlxEase.cubeOut});
    }
	if ((curBeat == 316))
	{
		defaultCamZoom = 1.3;
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, 1.32, {ease: FlxEase.cubeIn});
	}
	if (curBeat == 320)
	{
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.5, {ease: FlxEase.cubeOut});
		glitchybg.visible = true;
		windowblock.visible = true;
		window.visible = true;
		window2.visible = true;
		window3.visible = true;
		defaultCamZoom = 0.9;
		window3.angle -= 20 * Math.sin((curBeat*0.37));
		window3.y = 150 - 500  * Math.sin(curBeat*0.59);
		window3.x = 0 - 600  * Math.sin(curBeat*0.53);

	}
	if (curBeat >= 320)
	{    
		window.angle = 0 - 20 * Math.sin((curBeat*0.59));
		window.y = 150 - 300  * Math.sin(curBeat*0.43);
		window.x = 0 - 600  * Math.sin(curBeat*0.53);
		window2.angle -= 20 * Math.sin((curBeat*0.42));
		window2.y = 150 - 400  * Math.sin(curBeat*0.37);
		window2.x = 0 - 600  * Math.sin(curBeat*0.53);
		window3.angle -= 20 * Math.sin((curBeat*0.37));
		window3.y = 150 - 500  * Math.sin(curBeat*0.59);
		window3.x = 0 - 600  * Math.sin(curBeat*0.53);
	}
}
