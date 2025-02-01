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
function postCreate(){    diam = new FlxSprite().loadGraphic(Paths.image("stages/blizz/ss_diamond"));
diam.scale.set(1,1);
insert(7, diam);
diam.screenCenter();
diam.updateHitbox();
bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
insert(members.indexOf(dad)-1, bloodshedTrail);
}


function stepHit(curStep){
    if ((curStep >= 3) && (curStep < 1360))
        {
            for (i in 0...8)
            {
                diam.y += Math.sin(curStep/6)/1;
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
