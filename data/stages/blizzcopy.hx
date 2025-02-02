import openfl.system.Capabilities;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.effects.FlxTrail;
import openfl.display.BlendMode;
var Estatic:FlxSprite;
var bloodshedTrail = null;
var time:Float = 0;
var diam:FlxSprite;
var shutTheFuckUp:Bool = false;
Estatic = new FlxSprite().loadGraphic(Paths.image('stages/blizz/deadly2'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
var diamond:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_diamond'));
diamond.updateHitbox();
diamond.screenCenter();
diamond.active = false;
diamond.antialiasing = true;
diamond.scrollFactor.set(0.15, 0.15);
diamond.y -= 160;
function postCreate(){				defaultCamZoom = 0.85;
	curStage = 'snow';
	bgLol = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_sky'));
	bgLol.updateHitbox();
	bgLol.scale.x = 1;
	bgLol.scale.y = 1;
	bgLol.active = false;
	bgLol.antialiasing = true;
	bgLol.screenCenter();
	bgLol.scrollFactor.set(0.1, 0.1);
	insert(1, bgLol);
	add(bgLol);
	var graadienter:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_gradient'));
	graadienter.updateHitbox();
	graadienter.screenCenter();
	graadienter.active = false;
	graadienter.antialiasing = true;
	graadienter.scrollFactor.set(0.2, 0.2);
	insert(2, graadienter);
	add(graadienter);
	cloudsa = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_clouds'));
	cloudsa.updateHitbox();
	cloudsa.scale.x = 0.7;
	cloudsa.scale.y = 0.7;
	cloudsa.screenCenter();
	cloudsa.active = false;
	cloudsa.antialiasing = true;
	cloudsa.scrollFactor.set(0.2, 0.2);
	insert(3, cloudsa);
	add(cloudsa);
	var icicleb:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_iciclesbehind'));
	icicleb.updateHitbox();
	icicleb.scale.set(0.65,0.65);
	icicleb.screenCenter();
	icicleb.active = false;
	icicleb.antialiasing = true;
	icicleb.scrollFactor.set(0.3, 0.3);
	insert(4, icicleb);
	add(icicleb);
	var iciclef:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('stages/blizz/ss_iciclesnbulb'));
	iciclef.updateHitbox();
	iciclef.scale.set(0.65,0.65);
	iciclef.screenCenter();
	iciclef.active = false;
	iciclef.antialiasing = true;
	iciclef.scrollFactor.set(0.3, 0.3);
	insert(5, iciclef);
	add(iciclef);
	bgbleffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
	bgbleffect.updateHitbox();
	bgbleffect.antialiasing = true;
	bgbleffect.screenCenter();
	bgbleffect.scrollFactor.set();
	bgbleffect.alpha = 0.5;
	add(bgbleffect);
	satan = new FlxSprite(300, 200).loadGraphic(Paths.image('stages/blizz/ss_pentagram'));
	satan.antialiasing = true;
	satan.scale.set(1.2,1.2);
	satan.screenCenter();
	satan.scrollFactor.set(0.15, 0.15);
	satan.y -= 100;
	satan.active = true;
	insert(6, satan);
	add(satan);	
	insert(7, diamond);
add(diamond);
	var ground:FlxSprite = new FlxSprite(300,200).loadGraphic(Paths.image('stages/blizz/ss_ground'));
	ground.antialiasing = true;
	ground.screenCenter();
	ground.scrollFactor.set(0.9, 0.9);
	ground.active = false;
	insert(8, ground);
	add(ground);
	fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
	fx.setGraphicSize(Std.int(2560 * 0.75));
	fx.updateHitbox();
	fx.antialiasing = true;
	fx.screenCenter();
	fx.scrollFactor.set(0, 0);
	fx.alpha = 0.3;		
	Estatic = new FlxSprite().loadGraphic(Paths.image('stages/blizz/deadly2'));
	Estatic.scrollFactor.set();
	Estatic.screenCenter();
	Estatic.alpha = 0;
		Estatic2 = new FlxSprite();
	Estatic2.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_static');
	Estatic2.scale.set(4,4);
	Estatic2.animation.addByPrefix('idle', 'static instance 1', 24, true);
	Estatic2.animation.play('idle');
	Estatic2.scrollFactor.set();
	Estatic2.screenCenter();
	Estatic2.alpha = 0;
bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
insert(members.indexOf(dad)-1, bloodshedTrail);
}


function stepHit(curStep){
    if ((curStep >= 3) && (curStep < 1360))
        {
            for (i in 0...8)
            {
                diamond.y += Math.sin(curStep/6)/1;
                dad.y += Math.sin(curStep/6)/1;
            }
        }
	if ((curStep >= 256) && (curStep <= 512))
		{
			FlxG.camera.shake(0.01, 0.1);
			camHUD.shake(0.001, 0.15);
		}
//	if ((curStep >= 256))
//			{
//				snowemitter.x = FlxG.camera.scroll.x;
//				snowemitter.y = FlxG.camera.scroll.y - 40;
//			}
			

if ((curStep == 276))
{
    camGame.flash(FlxColor.WHITE, 1);
		var snowemitter:FlxTypedEmitter = new FlxTypedEmitter();
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-100, -640, 10, -720);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;
		snowemitter.acceleration.set(-600, 600, -300, -300);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(12,12,FlxColor.WHITE);
			p2.makeGraphic(24,24,FlxColor.WHITE);

			snowemitter.add(p);
			snowemitter.add(p2);
		}

		add(snowemitter);
		snowemitter.start(false, 0.02);
        snowemitter.x = 800;
		var snowemitter2:FlxTypedEmitter = new FlxTypedEmitter();
		snowemitter2.width = FlxG.width*1.5;
		snowemitter2.velocity.set(100, 640, -10, 720);
		snowemitter2.lifespan.set(5);
		snowemitter2.y = FlxG.height;
		snowemitter2.acceleration.set(600, -600, 300, 300);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(12,12,FlxColor.WHITE);
			p2.makeGraphic(24,24,FlxColor.WHITE);

			snowemitter2.add(p);
			snowemitter2.add(p2);
		}

		add(snowemitter2);
		snowemitter2.start(false, 0.02);
        snowemitter2.x = -800;
        add(Estatic);
        Estatic.alpha = 1;
        FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
    }
        if ((curStep == 280))
        {    
        
		FlxG.camera.shake(0.01, 0.1);
		camHUD.shake(0.001, 0.15);
}
		if ((curStep >= 256))
			{
				FlxG.camera.shake(0.01, 0.1);
				camHUD.shake(0.001, 0.15);
				if (curStep == 256)
				{
					FlxTween.angle(satan, 0, 359.99, 1.5, {
						ease: FlxEase.quadIn,
						onComplete: function(twn:FlxTween)
						{
							FlxTween.angle(satan, 0, 359.99, 0.15, { type: FlxTween.LOOPING });
						}
					});
				}
				if (health > 0.2)
					health -= 0.05;
			} else
			{
				if ((curStep == 1297) || (curStep == 614))
					FlxTween.cancelTweensOf(satan);
				if (satan.angle != 0)
					FlxTween.angle(satan, satan.angle, 359.99, 0.5, {ease: FlxEase.quadIn});
//				if (fx.alpha > 0.3)
//					fx.alpha -= 0.05;
			}

			if (curStep == 768)
			{
				FlxTween.tween(leBlack, {alpha: 1}, 1);
				FlxTween.tween(dad, {alpha: 0}, 1);
				snowemitter.emitting = false;
				shutTheFuckUp = true;
				FlxTween.tween(iconP2, {alpha: 0}, 1);
//				FlxTween.tween(fx, {alpha: 0}, 1);
			}
		}
