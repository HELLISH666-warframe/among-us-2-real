import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var bloodshedTrail = null;
var boom:FlxSound;
var time:Float = 0;
boom = FlxG.sound.load(Paths.sound("fanmade/alyxs_stuff/boom"));
override function update(elapsed:Float){time += elapsed;
	canvas.y=boyfriend.y+50;
	stone1.x = boyfriend.x - 800;
	stone2.x = boyfriend.x - 500;
	stone3.x = boyfriend.x - 100;
	stone1.y = boyfriend.y + 150;
	stone2.y = boyfriend.y + 350;
	stone3.y = boyfriend.y + 100;
	stone1.angle = stone1.angle - 0.05;
	stone2.angle = stone2.angle + 0.066;
	stone3.angle = stone3.angle - 0.058;
	noskin.y = boyfriend.y - 500;
	noskin.x = boyfriend.x - 1750;
	hind.y = boyfriend.y + 400;

	penty.angle=penty.angle-pentyVar;
}
function postCreate() {
	sadmoon.screenCenter(FlxAxes.X);
	backcity.screenCenter(FlxAxes.X);
	kamehameha.screenCenter(FlxAxes.X);
	kamehameha.alpha=0;
	penty.screenCenter(FlxAxes.X);
	frontcity.screenCenter(FlxAxes.X);
	backhill.screenCenter(FlxAxes.X);
	fronthill.screenCenter(FlxAxes.X);
	hind.screenCenter(FlxAxes.X);
	hind.alpha=0;
	foreskin.screenCenter(FlxAxes.X);
	foreskinclean.screenCenter(FlxAxes.X);
	noskin.screenCenter(FlxAxes.X);
	noskin.alpha=0;
	island.screenCenter(FlxAxes.X);
	island.alpha=0;
	island2.screenCenter(FlxAxes.X);
	island2.alpha=0;
	deadly1.scale.set(1,0.8);
	deadly1.camera=camOther2;
	deadly1.alpha=0;
	deadly2.scale.set(1,0.8);
	deadly2.camera=camOther2;
	deadly2.alpha=0;
	googoo.camera=camOther2;
	googoo.alpha=0;
	googoo.screenCenter();
	grade.camera=camOther2;
	grade.alpha=1;
	grade.screenCenter();
	alive.camera=camHUD;
	alive.alpha=0;
	alive.screenCenter();
	alivefake.camera=camOther2;
	alivefake.alpha=0;
	alivefake.screenCenter();
	deadfake.camera=camHUD;
	deadfake.alpha=0;
	deadfake.screenCenter();
	dead.camera=camOther2;
	dead.alpha=0.25;
	dead.screenCenter();

	var rainbTmr = new FlxTimer().start(0.06, function(tmr:FlxTimer)        {
		kamehameha.y =kamehameha.y + 250;
	});
}
function resettrial(){		
	remove(bloodshedTrail);
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	insert(members.indexOf(dad)-1, bloodshedTrail);
}
function beatHit(curBeat){
	if (curBeat == 32)
	{ 
    FlxTween.tween(dead, {alpha: 1}, 0.5, {ease: FlxEase.quadInOut});
    FlxTween.color(pentycanvas, {color: 0xFFFFFFFF}, 3,{ease: FlxEase.linear});
    FlxTween.tween(pentycanvas, {"scale.x":3,"scale.y":3}, 1.5, {ease: FlxEase.quadInOut});
    FlxTween.tween(pentycanvas, {x:280,y:170}, 1.5, {ease: FlxEase.quadInOut});
   // doTweenAlpha('icooooonBite', 'simge2', 0, 1.5, 'quadInOut')
	}
    if (curBeat == 36){
    FlxTween.tween(alive, {alpha: 0.4}, 1, {ease: FlxEase.quadIn});
    FlxTween.tween(grade, {alpha: 0}, 1.75, {ease: FlxEase.quadInOut});
    FlxTween.tween(pentycanvas, {y: -5000}, 1.25, {ease: FlxEase.quadIn});
    FlxTween.tween(pentycanvas, {angle: -720}, 1.25, {ease: FlxEase.quadIn});
    penty.angle=0;
    }
	if (curBeat == 38)
	{ 
	FlxTween.tween(penty, {y: -500}, 0.75, {ease: FlxEase.quadOut});
	}
	if (curBeat == 40)
	{     
	FlxTween.tween(alive, {alpha: 0}, 1, {ease: FlxEase.quadOut});
	cameraSpeed = 1;
	alive.alpha = 1;
	dead.alpha = 0;
	}
	if (curBeat == 104)
	{     
    FlxTween.tween(penty, {y: -2750}, 1.5, {ease: FlxEase.quadIn});
	FlxTween.tween(canvasclean, {y: -7750}, 1.25, {ease: FlxEase.quadIn});
	FlxTween.tween(alivefake, {alpha: 1}, 1, {ease: FlxEase.quadIn});
	}
	if (curBeat == 108){
    FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadIn});
    FlxTween.tween(tree3, {y: -6000}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(tree4, {y: -5800}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(tree3, {x: -100}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(tree4, {x: 800}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(building1, {y: -4800}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(building2, {y: -4600}, 3.5, {ease: FlxEase.quadOut});
    FlxTween.tween(building3, {x: -5000}, 3.5, {ease: FlxEase.quadOut});
    tree1.scale.set(0.4,0.4);
    tree2.scale.set(0.4,0.4);
    tree3.scale.set(0.4,0.4);
    tree4.scale.set(0.4,0.4);
    kamehameha.alpha=1;
    googoo.alpha=0.7;
    stone1.alpha=0;
    stone2.alpha=0;
    stone3.alpha=0;
    canvasclean.alpha=0;
    foreskinclean.alpha=0;
    canvas.alpha=1;
    foreskin.alpha=1;
    pentycanvas.alpha=0;
    }
	if (curBeat == 156)
	{     
	FlxTween.tween(FlxG.camera, {zoom: 0.9}, 5.5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {angle: -180}, 5.5, {ease: FlxEase.linear});
	FlxTween.tween(boyfriend, {y: -5825}, 5.5, {ease: FlxEase.quadIn});
	FlxTween.tween(dad, {y: -6000}, 5.5, {ease: FlxEase.quadIn});
	FlxTween.tween(penty, {y: -1950}, 5.5, {ease: FlxEase.quadIn});
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
	if (curBeat == 168){
    FlxTween.tween(alive, {alpha: 1}, 1, {ease: FlxEase.quadIn});
    }
	if (curBeat == 172){
    FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(alive, {alpha: 0}, 1.25, {ease: FlxEase.quadOut});
    island.alpha=1;
    island2.alpha=1;
    googoo.alpha=0.4;
    alivefake.alpha=1;
    }
	if (curBeat == 218){
    FlxTween.tween(grade, {alpha: 1}, 1.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(dead, {alpha: 0.25}, 1.25, {ease: FlxEase.quadInOut});
    }
	if (curBeat == 234){
    FlxTween.tween(grade, {alpha: 0}, 1.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(dead, {alpha: 0}, 1.25, {ease: FlxEase.quadInOut});
    }
	if (curBeat == 300){
    FlxTween.tween(alivefake, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(grade, {alpha: 1}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(dead, {alpha: 0.75}, 0.75, {ease: FlxEase.quadOut});
    alivefake.alpha=1;
    }
	if (curBeat == 308){
    FlxTween.tween(alivefake, {alpha: 1}, 2.75, {ease: FlxEase.quadIn});
    FlxTween.tween(dead, {alpha: 0.25}, 0.75, {ease: FlxEase.quadIn});
	alivefake.alpha=1;
    }
	if (curBeat == 316){
    FlxTween.tween(alivefake, {alpha: 0}, 0.5, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.75, {ease: FlxEase.quadOut});
    defaultCamZoom=0.9;
    hind.alpha=1;
    noskin.alpha=1;
    canvas.alpha=0;
    }
	if (curBeat == 343){
    FlxTween.tween(FlxG.camera, {angle: 0}, 1.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=1;
    }
    if (curBeat == 347){
    FlxTween.tween(FlxG.camera, {angle: -15}, 2.75, {ease: FlxEase.quadInOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.9;
    }
    if (curBeat == 376){
    FlxTween.tween(FlxG.camera, {angle: 0}, 1.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(FlxG.camera, {zoom: 1}, 1.25, {ease: FlxEase.quadInOut});
    defaultCamZoom=1;
    }
	if (curBeat == 380){
    FlxG.camera.shake(0.005, 0.75);
    camHUD.shake(0.0025, 0.75);
    FlxTween.tween(FlxG.camera, {zoom: 0.8}, 1.75, {ease: FlxEase.quadOut});
    defaultCamZoom=0.8;
    FlxTween.tween(hind, {alpha: 0.5}, 0.5, {ease: FlxEase.quadOut});
    FlxTween.tween(noskin, {alpha: 0.5}, 0.5, {ease: FlxEase.quadOut});
    }
    if (curBeat == 381){
    FlxTween.tween(hind, {alpha: 1}, 0.5, {ease: FlxEase.quadIn});
    FlxTween.tween(noskin, {alpha: 1}, 0.5, {ease: FlxEase.quadIn});
    }
    if (curBeat == 410){
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 1.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.7;
    }
	if (curBeat == 412){
    FlxTween.tween(dad, {alpha: 0.5}, 0.5, {ease: FlxEase.circIn});
    FlxTween.tween(hind, {alpha: 0.75}, 0.5, {ease: FlxEase.circIn});
    FlxTween.tween(noskin, {alpha: 0.75}, 0.5, {ease: FlxEase.circIn});
    FlxTween.tween(canvas, {alpha: 0.25}, 0.5, {ease: FlxEase.circIn});
    }
	if (curBeat == 426){
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.9;
    }
    if (curBeat == 444){
    FlxTween.tween(FlxG.camera, {zoom: 0.4}, 1.25, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.4;
    }
	if (curBeat == 448){
    FlxG.camera.shake(0.05, 0.25);
    camHUD.shake(0.025, 0.25);
    FlxTween.tween(FlxG.camera, {angle: 35}, 0.15, {ease: FlxEase.quadIn});
    FlxTween.tween(alive, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(grade, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(dead, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.5, {ease: FlxEase.bounceOut});
    defaultCamZoom=0.6;
    alive.alpha=1;
    cameraSpeed = 4;
    hind.alpha=0;
    noskin.alpha=0;
    topBar.alpha=0;
    bottomBar.alpha=0;
    deadfake.alpha=0;
    dad.alpha=1;
    }
	if (curBeat == 454){
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.15, {ease: FlxEase.bounceOut});
    defaultCamZoom=0.7;
    }
    if (curBeat == 456){
    FlxTween.tween(FlxG.camera, {angle: 35}, 0.15, {ease: FlxEase.quadIn});
    FlxTween.tween(FlxG.camera, {zoom: 0.8}, 0.25, {ease: FlxEase.bounceOut});
    defaultCamZoom=0.8;
    }
    if (curBeat == 458){
    FlxTween.tween(FlxG.camera, {angle: -35}, 0.15, {ease: FlxEase.quadIn});
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.25, {ease: FlxEase.bounceOut});
    defaultCamZoom=0.9;
    }
    if (curBeat == 460){
    FlxTween.tween(FlxG.camera, {angle: -35}, 0.15, {ease: FlxEase.quadIn});
    FlxTween.tween(FlxG.camera, {zoom: 1}, 0.25, {ease: FlxEase.bounceOut});
    defaultCamZoom=1;
    }
    if (curBeat == 462){
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.15, {ease: FlxEase.quadIn});
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.5, {ease: FlxEase.bounceOut});
    defaultCamZoom=0.6;
    }
    if (curBeat == 464){
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 5, {ease: FlxEase.linear});
    defaultCamZoom=0.9;
    }
	if (curBeat == 476){
    //doTweenAlpha('byebyeStats', 'scoreTxt', 0, 1.25, 'quadIn')
    FlxTween.tween(building1, {y: -4800}, 1.5, {ease: FlxEase.quadOut});
    FlxTween.tween(building2, {y: -4600}, 1.5, {ease: FlxEase.quadOut});
    FlxTween.tween(building3, {x: -5000}, 1.5, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.4}, 1.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(FlxG.camera, {angle: 180}, 1.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(boyfriend, {y: -11800}, 1.5, {ease: FlxEase.quadIn});
    FlxTween.tween(dad, {y: -12000}, 1.5, {ease: FlxEase.quadIn});
    FlxTween.tween(penty, {y: -4750}, 1.25, {ease: FlxEase.quadIn});
    FlxTween.tween(boyfriend, {angle: 360}, 1, {ease: FlxEase.quadIn});
    FlxTween.tween(alive, {alpha: 1}, 1, {ease: FlxEase.quadIn});
    defaultCamZoom=0.4;
    cameraSpeed = 0.3;
    }
	if (curBeat == 480){
    FlxG.sound.play(Paths.sound('fanmade/alyxs_stuff/boom'), 0.4);
    FlxTween.tween(FlxG.camera, {zoom: 1.2}, 10, {ease: FlxEase.linear});
    FlxTween.tween(FlxG.camera, {angle: 35}, 10, {ease: FlxEase.linear});
    FlxTween.tween(alivefake, {alpha: 0}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(alive, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    cameraSpeed = 4;
    defaultCamZoom=1.5;
    FlxG.camera.angle=0;
    penty.scale.set(3.5,3.5);
    googoo.alpha=0.7;
    penty.screenCenter(FlxAxes.X);
    island.alpha=0;
    island2.alpha=0;
    alivefake.alpha=1;
    dad.angle=0;
    dad.y=-12000;
    }
	 if (curBeat == 511){
    FlxTween.tween(FlxG.camera, {zoom: 0.4}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.4;
    }
    if (curBeat == 512){
    FlxTween.tween(FlxG.camera, {zoom: 1.5}, 11, {ease: FlxEase.linear});
    FlxTween.tween(FlxG.camera, {angle: -35}, 11, {ease: FlxEase.linear});
    defaultCamZoom=1.5;
    }
    if (curBeat == 543){
    FlxTween.tween(FlxG.camera, {zoom: 0.5}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.5;
    }
    if (curBeat == 544){
    FlxTween.tween(boyfriend, {y: -250}, 2.75, {ease: FlxEase.quadInOut});
    FlxTween.tween(dad, {y: 300}, 2.75, {ease: FlxEase.quadInOut});
    FlxTween.tween(penty, {y: -1500}, 2.75, {ease: FlxEase.quadInOut});
    FlxTween.tween(kamehameha, {alpha: 0}, 1.25);
    FlxTween.tween(alive, {alpha: 1}, 1.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.9;
    }
	if (curBeat == 548){
    FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.quadOut});
    FlxTween.tween(scoreTxt, {alpha: 1}, 1.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.4}, 2.25, {ease: FlxEase.quadInOut});
    FlxTween.tween(alive, {alpha: 0}, 0.75, {ease: FlxEase.quadOut});
    defaultCamZoom=0.4;
    boyfriend.angle=0;
    cameraSpeed = 0.6;
    googoo.alpha=0;
    stone1.alpha=0;
    stone2.alpha=0;
    stone3.alpha=0;
    canvas.angle=0;
    dad.y=300;
    }
	if (curBeat == 556){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.6;
    }
    if (curBeat == 564){
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.quadIn});
    defaultCamZoom=0.9;
    FlxTween.tween(dead, {zoom: 1}, 1, {ease: FlxEase.quadIn});
    }
	if (curBeat >= 40)
	{    				
		FlxG.camera.shake(0.00125, 0.05);
		camHUD.shake(0.000625, 0.05);
	}
}