//fuck_you_im_Doing_all_the_events_in_stage
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;
var cameramove:Bool = false;
var windowmove:Bool = false;
var intensecameramove:Bool = false;
var satan:FlxSprite = new FlxSprite(-100,-600).loadGraphic(Paths.image('stages/hell/hellRon_satan'));
satan.setGraphicSize(Std.int(satan.width * 1.2));
satan.scrollFactor.set(0.2, 0.4);
satan.screenCenter();
satan.updateHitbox();
var fx:FlxSprite;
var Estatic:FlxSprite;
var explode:FlxSound;
var time:Float = 0;
var iTime:Float = 0;
var exploders:FlxSprite = new FlxSprite();
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");
var bloodshedTrail = null;
var currentBeat:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/60);
var rain:flixel.effects.particles.FlxTypedEmitter;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
//rain.cameras = [camHUD];
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");

explode = FlxG.sound.load(Paths.sound("hellexplode"));

fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;

Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
var currentBeat:Float = ((Conductor.songPosition / 1000)*(Conductor.bpm/60));
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
    rain.data.iTime.value = [-24*Math.sin(time)];
	if (windowmove)
		{
			window.move(Math.round(34 * Math.sin(time * Math.PI) + 327), Math.round(34 * Math.sin(time * 3) + 160));
		}
	if (cameramove)
		{
			camHUD.angle = 22 * Math.sin((currentBeat/4) * Math.PI);
			FlxG.camera.angle = 4 * Math.sin((currentBeat/4) * Math.PI);
		}
	if (intensecameramove)
		{
			camHUD.angle = 45 * Math.sin((currentBeat/2) * Math.PI);
			FlxG.camera.angle = 9 * Math.sin((currentBeat/2) * Math.PI);
		}
}
function postCreate() {
	hellbg.setGraphicSize(Std.int(hellbg.width * 5));
	hellbg.y += hellbg.height / 5;
    blackeffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.width*3, FlxColor.BLACK);
    blackeffect.updateHitbox();
    blackeffect.antialiasing = true;
    blackeffect.screenCenter();
    blackeffect.scrollFactor.set();
    blackeffect.alpha = 0;
    add(blackeffect);
    
    var exploders:FlxSprite = new FlxSprite();
    exploders.cameras = [camHUD];
    exploders.frames = Paths.getSparrowAtlas('stages/hellStreet/explosion');
    exploders.scrollFactor.set(0, 0);
    exploders.animation.addByPrefix('explosion', 'explosion', 24, false);
    exploders.updateHitbox();
    exploders.screenCenter();
    insert(0,exploders);
    exploders.animation.play('explosion');
    exploders.scale.set(0.01,0.01);
    exploders.alpha = 0.01;
	sky3.visible =  city3.visible = mountains3.visible =  hellbg.visible =  firebg.visible  =  street3.visible =  bloodshed_lamp.visible = firetrojan_staticbg.visible = islands.visible = false;

	sky2.visible =  city2.visible = mountains2.visible =  hillfront2.visible =  fog2.visible = street2.visible = false;
}
function stepHit(curStep)
{
	if (curStep == 152)
    {
	sky.visible =  bigcloud.visible = backcity.visible =  city.visible =  backmountain.visible = mountain.visible =  hill.visible =  street.visible = false;
	sky2.visible =  city2.visible = mountains2.visible =  hillfront2.visible =  fog2.visible = street2.visible = true;
	FlxG.camera.addShader(rain);
    rain.data.zoom.value = [40];
    rain.data.raindropLength.value = [0.1];
    rain.data.opacity.value = [0.25];
    }
	if (curStep == 153)
	{
		insert(16, satan);
		add(satan);
		FlxTween.tween(satan, {alpha: 0.3}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.angle(satan, 0, 359.99, 1.5, 
			{ 
			ease: FlxEase.quadIn, 
			onComplete: function(twn:FlxTween) 
				{
					FlxTween.angle(satan, 0, 59.99, 0.33, { type: FlxTween.LOOPING } );
				}
			} 
		);
	}	
	if (curStep == 225)
	{
		FlxTween.tween(blackeffect, {alpha: 1}, 0.5, {ease: FlxEase.circInOut,});
	}	
	if (curStep == 246)
	{
		FlxTween.tween(blackeffect, {alpha: 0}, 0.5, {ease: FlxEase.circOut,});
		FlxTween.tween(satan, {alpha: 0.6}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.angle(satan, 0, 359.99, 1.5, 
			{ ease: FlxEase.quadIn, onComplete: function(twn:FlxTween) 
				{FlxTween.angle(satan, 0, 159.99, 0.33, { type: FlxTween.LOOPING } );}} );
	}	
	if (curStep == 338)
	{
		sky2.visible =  city2.visible = mountains2.visible =  hillfront2.visible =  fog2.visible = street2.visible = false;
		sky3.visible =  city3.visible = mountains3.visible =  hellbg.visible =  firebg.visible =  street3.visible = true;
		add(Estatic);
		Estatic.alpha = 1;
		FlxTween.tween(satan, {alpha: 1}, 0.25, {ease: FlxEase.linear});
		remove(satan);
		insert(24, satan);
		add(satan);
		FlxTween.angle(satan, 0, 859.99, 1.5, 
			{ 
			ease: FlxEase.quadIn, 
			onComplete: function(twn:FlxTween) 
				{
					FlxTween.angle(satan, 0, 859.99, 0.33, { type: FlxTween.LOOPING } );
				}
			} 
		);
		FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
	}	
	if (curStep == 341)
	{
        bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
        insert(members.indexOf(dad)-1, bloodshedTrail);
	}	
	if (curStep == 744)
	{
	sky3.visible =  city3.visible = mountains3.visible  = satan.visible =  street3.visible = false;
	firetrojan_staticbg.visible = true;
	firetrojan_staticbg.alpha = 0.7;
	remove(bloodshedTrail);
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	insert(members.indexOf(dad)-1, bloodshedTrail);
		{
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 325}, (Conductor.crochet/600), {ease: FlxEase.linear});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 800}, (Conductor.crochet/600), {ease: FlxEase.linear});
		}
		insert(members.indexOf(dad), rainbowscreen);
		add(rainbowscreen);
		FlxG.camera.addShader(chrom);
			chrom.data.rOffset.value = [1*Math.sin(curStep*4)/2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [1*Math.sin(curStep*4) * -1/2];
	}
}