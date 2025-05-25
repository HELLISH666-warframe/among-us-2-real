/*import flixel.text.FlxTextBorderStyle;
var wig:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var time:Float = 0;
var boing:Bool = false;

var credits:FlxSprite = new FlxSprite(-210, -1000).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/credbar'));
credits.scrollFactor.set(1,1);
credits.scale.set( 3.25, 3.25);
credits.updateHitbox();
credits.screenCenter();
credits.cameras = [camHUD];

var credits2:FlxSprite = new FlxSprite( 800, 850).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/credits'));
credits2.scrollFactor.set(1,1);
credits2.scale.set( 2, 2);
credits2.updateHitbox();
credits2.screenCenter();
credits2.cameras = [camHUD];

var musician:FlxText = new FlxText(300, 100, 0, "musician",25);
musician.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
musician.y = -350;
musician.cameras = [camHUD];

var musician2:FlxText = new FlxText(300, 100, 0, "The Funny",25);
musician2.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
musician2.y = -350;
musician2.angle = -20;
musician2.cameras = [camHUD];

var musicianicon:FlxSprite = new FlxSprite(100, 100).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/cartman'));
musicianicon.scale.set( 0.15, 0.15);
//musicianicon.scrollFactor.set(1,1);
musicianicon.updateHitbox();
musicianicon.screenCenter();
musicianicon.cameras = [camHUD];
musicianicon.y = -350;
musicianicon.angle = -20;

var artist:FlxText = new FlxText(1100, 100, 0, "Artist",25);
artist.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
artist.y = -500;
artist.cameras = [camHUD];

var artist2:FlxText = new FlxText(1100, 100, 0, "ShaeRon",25);
artist2.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
artist2.cameras = [camHUD];
artist2.y = -500;
artist2.angle = -20;

var artisticon:FlxSprite = new FlxSprite(485, 100).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/shae'));
artisticon.scale.set( 0.5, 0.5);
//artisticon.scrollFactor.set(0.2,0.2);
artisticon.updateHitbox();
artisticon.screenCenter();
artisticon.y = -500;
artisticon.angle = -20;
artisticon.cameras = [camHUD];

var coder:FlxText = new FlxText(1900, 100, 0, "coder",25);
coder.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
coder.screenCenter();
coder.cameras = [camHUD];
coder.y = -650;

var coder2:FlxText = new FlxText(1900, 100, 0, "Alyx",25);
coder2.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
coder2.cameras = [camHUD];
coder2.y = -650;
coder2.angle = -20;

var codericon:FlxSprite = new FlxSprite( 910, 100).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/credbar/alyx'));
codericon.scale.set( 1, 1);
//codericon.scrollFactor.set(1,1);
codericon.updateHitbox();
//codericon.screenCenter();
codericon.y = -650;
codericon.angle = -20;
codericon.cameras = [camHUD];

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];

	if ((curBeat  <= 32))
	{
		musician2.x = musician.x + 10;
		musician2.y = musician.y + 35;
		artist2.x = artist.x - 400;
		artist2.y = artist.y + 35;
		coder2.x = coder.x + 10;
		coder2.y = coder.y + 35;
		musicianicon.y = musician2.y - 15;
		artisticon.y = artist2.y + 5;
		codericon.y = coder2.y - 35;
	}
}
function postCreate() 
{
	credits.scale.set(3.25, 3.25);
	if (PlayState.difficulty.toLowerCase() == 'fanmade-d') 
		{
			add(credits);
			add(credits2);
			add(musician);
			add(musician2);
			add(musicianicon);
			add(artist);
			add(artist2);
			add(artisticon);
			add(coder);
			add(coder2);
			add(codericon);

		}
}
function stepHit(step)
{if (PlayState.difficulty.toLowerCase() == 'hard') 
{
	switch (step)
	{
	case 384:
		FlxG.camera.addShader(chrom);
		camHUD.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		FlxG.camera.addShader(wig);
		camHUD.addShader(wig);
		wig.data.on.value = [1.];
		camHUD.shake(0.002);
		defaultCamZoom = 0.8;
		case 1432:
			FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.circInOut});
		case 1490:
			defaultCamZoom = 1;
	}
	if ((curStep >= 384) && (curStep <= 640))
		FlxG.camera.shake(0.00625, 0.1);
	
	camHUD.shake(0.00125, 0.15);
}
}
function onSongStart() {if (PlayState.difficulty.toLowerCase() == 'fanmade-d') 
	{

		FlxTween.tween(credits, {y: credits.y -50}, 1.5, {ease: FlxEase.bounceOut});
		FlxTween.tween(credits2, {y: credits2.y =450}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(musician, {y: musician.y =450}, 1.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(artist, {y: artist.y =300}, 1.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(coder, {y: coder.y =150}, 1.5, {ease: FlxEase.cubeOut});
		FlxTween.tween(credits2, {angle: credits2.angle =20}, 1, {ease: FlxEase.cubeOut});
		FlxTween.tween(musician, {angle: musician.angle -20}, 1.5, {ease: FlxEase.bounceOut});
		FlxTween.tween(artist, {angle: artist.angle -20}, 1.5, {ease: FlxEase.bounceOut});
		FlxTween.tween(coder, {angle: coder.angle -20}, 1.5, {ease: FlxEase.bounceOut});
	}
}
function beatHit(beat)
{if (PlayState.difficulty.toLowerCase() == 'fanmade-d') 
	{
	if ((curBeat == 16))
		{
			FlxTween.tween(credits, {y: credits.y -100}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(credits, {y: credits.y +1100}, 1, {ease: FlxEase.cubeIn});}});
			FlxTween.tween(credits2, {y: credits2.y =400}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(credits2, {y: credits2.y +850}, 1, {ease: FlxEase.cubeIn});}});
			FlxTween.tween(credits2, {angle: credits2.angle =40}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(credits2, {angle: credits2.angle -20}, 1, {ease: FlxEase.cubeIn});}});
			FlxTween.tween(musician, {y: musician.y =400}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(musician, {y: musician.y +850}, 1, {ease: FlxEase.cubeIn});}});
			FlxTween.tween(artist, {y: artist.y =150}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(artist, {y: artist.y +1450}, 1, {ease: FlxEase.cubeIn});}});
			FlxTween.tween(coder, {y: coder.y =100}, 0.5, {ease: FlxEase.cubeOut, 								
				onComplete: function(twn:FlxTween)
				{FlxTween.tween(coder, {y: coder.y +1300}, 1, {ease: FlxEase.cubeIn});}});
		}
		if (curBeat  <= 32)
		{
			musicianicon.y = musician2.y - 15;
			if (curBeat % 2 == 0)
			{
				FlxTween.tween(musicianicon, {angle: musicianicon.angle -20}, 0.75, {ease: FlxEase.cubeOut});
				codericon.angle = -40;
				musicianicon.angle = 160;
			}
			credits2.scale.x = 2.1;
			credits2.scale.y = 2.1;
			musicianicon.scale.x = 0.175;
			musicianicon.scale.y = 0.175;
			artisticon.scale.x = 0.55;
			artisticon.scale.y = 0.55;
			codericon.scale.x = 1.1;
			codericon.scale.y = 1.1;
			FlxTween.tween(credits2, {"scale.x": 2}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(credits2, {"scale.y": 2}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.cubeOut});
			camHUD.zoom = 1.025;
			FlxTween.tween(musicianicon, {"scale.x": 0.15}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(musicianicon, {"scale.y": 0.15}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(artisticon, {"scale.x": 0.5}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(artisticon, {"scale.y": 0.5}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(codericon, {"scale.x": 1}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(codericon, {"scale.y": 1}, 0.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(codericon, {angle: codericon.angle -20}, 0.5, {ease: FlxEase.cubeOut});
		}
	}
}*/