var time:Float = 0;
var iTime:Float = 0;
var appearscreen:Bool = true;
importScript("data/scripts/windowspam");
//FlxG.resizeWindow(width, 1180);
//FlxG.scaleMode.width = 1180;
//FlxG.scaleMode.height = 960;
//     camHUD.height = 957;
override function update(elapsed:Float){}

function create() {

}
function stepHit(curStep)
    {
        {
            if (curStep == 1)
                {
                    for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 325}, (Conductor.crochet/600), {ease: FlxEase.linear});
                    for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 650 }, (Conductor.crochet/400), {ease: FlxEase.linear});
                }
            }
        }
        function postCreate(){
            defaultCamZoom = 0.9;
            //curStage = 'verymad';
            var bg2:FlxSprite = new FlxSprite();
            bg2.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_bg');
            bg2.scale.set(4,4);
            bg2.animation.addByPrefix('idle', 'bg instance 1', 24, true);
            bg2.animation.play('idle');
            bg2.scrollFactor.set(0.05, 0.05);
            bg2.screenCenter();
            insert(1, bg2);
            add(bg2);
            Estatic2 = new FlxSprite();
            Estatic2.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_static');
            Estatic2.scale.set(4,4);
            Estatic2.animation.addByPrefix('idle', 'static instance 1', 24, true);
            Estatic2.animation.play('idle');
            Estatic2.scrollFactor.set();
            Estatic2.screenCenter();
            insert(2, Estatic2);
            add(Estatic2);
            var console:FlxSprite = new FlxSprite();
            console.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_console');
            console.scale.set(4,4);
            console.animation.addByPrefix('idle', 'ezgif.com-gif-maker (7)_gif instance 1', 24, true);
            console.animation.play('idle');
            console.scrollFactor.set(0.05, 0.05);
            console.screenCenter();
            console.alpha = 0.3;
            insert(3, console);
            add(console);
            var popup:FlxSprite = new FlxSprite();
            popup.frames = Paths.getSparrowAtlas('stages/trojan-virus/atelo_popup_animated');
            popup.scale.set(4,4);
            popup.animation.addByPrefix('idle', 'popups instance 1', 24, true);
            popup.animation.play('idle');
            popup.scrollFactor.set(0.05, 0.05);
            popup.screenCenter();
            add(popup);
            bgLol = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/classicStages/veryAngreRon_sky'));
            bgLol.updateHitbox();
            bgLol.scale.x = 1;
            bgLol.scale.y = 1;
            bgLol.active = false;
            bgLol.antialiasing = true;
            bgLol.screenCenter();
            bgLol.scrollFactor.set(0.1, 0.1);
            insert(4, bgLol);
            add(bgLol);
            witheredRa = new FlxSprite(-512, -260);
            witheredRa.frames = Paths.getSparrowAtlas('stages/annoyed_rain');
            witheredRa.setGraphicSize(Std.int(witheredRa.width * 4));
            witheredRa.animation.addByPrefix('rain', 'rain', 24, true);
    witheredRa.updateHitbox();
    witheredRa.antialiasing = true;
    witheredRa.scrollFactor.set(0.5,0.1);
    witheredRa.screenCenter();
    insert(5, witheredRa);
    add(witheredRa);
    witheredRa.animation.play('rain');
            
    cloudsa = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/classicStages/veryAngreRon_clouds'));
    cloudsa.updateHitbox();
    cloudsa.scale.x = 0.7;
    cloudsa.scale.y = 0.7;
    cloudsa.screenCenter();
    cloudsa.active = false;
    cloudsa.antialiasing = true;
    cloudsa.scrollFactor.set(0.2, 0.2);
    insert(6, cloudsa);
    add(cloudsa);
    /*var glitchEffect = new FlxGlitchEffect(8,10,0.4,FlxGlitchDirection.HORIZONTAL);
    var glitchSprite = new FlxEffectSprite(bg, [glitchEffect]);
    add(glitchSprite);*/
            
    lampt = new FlxSprite(900, 100);
    lampt.frames = Paths.getSparrowAtlas('stages/classicStages/glitch_lamp');
    lampt.scale.set(2,2);
    lampt.animation.addByPrefix('idle', 'lamppost', 24, true);
    lampt.animation.play('idle');
    lampt.scrollFactor.set(0.9, 0.9);
    insert(7, lampt);
    add(lampt);
    lampt.alpha = 0;
    groundt = new FlxSprite(-537, -290).loadGraphic(Paths.image('stages/classicStages/trojan_ground'));
    groundt.updateHitbox();
    groundt.active = false;
    groundt.antialiasing = true;
    insert(8, groundt);
    add(groundt);
    groundt.alpha = 0;
            
    groundover = new FlxSprite(-537, -250).loadGraphic(Paths.image('stages/classicStages/veryAngreRon_ground'));
    groundover.updateHitbox();
    groundover.active = false;
    groundover.antialiasing = true;
    insert(9, groundover);
    add(groundover);
}
function stepHit(step)
    {
     //   witheredClouds.x += 2;
		{
			switch (curStep) {
				case 256:
					FlxTween.tween(cloudsa, {alpha: 0}, 1, {ease: FlxEase.quadIn});
					FlxTween.tween(witheredRa, {alpha: 0}, 1, {ease: FlxEase.quadIn});
					FlxTween.tween(bgLol, {alpha: 0}, 1, {ease: FlxEase.quadIn});
					camHUD.shake(0.002);
					defaultCamZoom += 0.2;
				case 640:
					defaultCamZoom -= 0.3;
				case 896 | 900 | 904:
					defaultCamZoom += 0.05;
				case 908:
					defaultCamZoom += 0.05;
					FlxTween.tween(lampt, {alpha: 1}, 1, {ease: FlxEase.quadOut});
					FlxTween.tween(groundover, {alpha: 0}, 1, {ease: FlxEase.quadOut});
					FlxTween.tween(groundt, {alpha: 1}, 0.25, {ease: FlxEase.quadOut});
				case 1160:
					camHUD.alpha = 0;
					FlxG.camera.angle = 10;
					defaultCamZoom += 0.15;
					FlxG.camera.zoom += 0.15;
				case 1164:
					FlxG.camera.angle = -10;
					defaultCamZoom += 0.15;
					FlxG.camera.zoom += 0.15;
					FlxTween.tween(camHUD, {alpha: 1}, 0.25, {ease: FlxEase.quadOut});
				case 1166:
					FlxG.camera.angle = 10;
					defaultCamZoom += 0.15;
					FlxG.camera.zoom += 0.15;
				case 1168:
					FlxG.camera.angle = -10;
					FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.quadOut});
					FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.quadOut});
					FlxG.camera.setFilters([ShadersHandler.chromaticAberration]);
					camHUD.setFilters([ShadersHandler.chromaticAberration]);
					defaultCamZoom -= 0.45;
				case 1424:
					defaultCamZoom -= 0.2;
				case 1584:
					FlxTween.tween(camGame, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
					FlxTween.tween(camHUD, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
					var randomthing:FlxSprite = new FlxSprite();
					randomthing.loadGraphic(Paths.image('updateron/PopUps/bsod', 'shared'));
					randomthing.updateHitbox();
					randomthing.antialiasing = true;
					add(randomthing);
					randomthing.screenCenter();
					randomthing.scale.set(1.2,1.2);
					randomthing.cameras = [camOverlay];
					FlxTween.tween(randomthing,{'scale.x':1,'scale.y':1}, 0.25, {ease: FlxEase.sineOut});
					new FlxTimer().start(5 , function(tmr:FlxTimer)
					{
						FlxTween.tween(randomthing, {alpha: 0}, 1, {ease: FlxEase.sineOut});
						FlxTween.tween(randomthing, {'scale.y':0}, 0.5, {ease: FlxEase.backIn});
					});
				case 1692:
					FlxTween.tween(camGame, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
					defaultCamZoom = 1;
					FlxTween.tween(FlxG.camera, {zoom: 1}, 0.4, {ease: FlxEase.expoOut,});
				case 1708:
					dad.visible = false;
					ronAnimation.x = dad.x;
					ronAnimation.y = dad.y;
					ronAnimation.visible = true;
					ronAnimation.animation.play('idle', true);
			}
			if ((curStep >= 256) && (curStep <= 640))
				FlxG.camera.shake(0.00625, 0.1);
			if ((curStep >= 908) && (curStep <= 1424))
			{
				FlxG.camera.shake(0.00625, 0.1);
				windowSpawn();
			}
			
			camHUD.shake(0.00125, 0.15);
		}}