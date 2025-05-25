if (PlayState.difficulty.toLowerCase() == 'hard'){
import flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
var fgfxtwo = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
var time:Float = 0;
var rain:FlxTypedEmitter = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");
var glitch:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var crt = new CustomShader('fake CRT');
var ray = new CustomShader('godray');

var defaultStrumY:Float = 50;

public var camOverlay:FlxCamera;
camOverlay = new FlxCamera();

function postCreate() {
	fgfxtwo.scale.set(3, 3);
	fgfxtwo.alpha = 0.5;
	fgfxtwo.scrollFactor.set(0.4, 0.4);
	add(fgfxtwo);			
	fgfxtwo.visible = false;
	fxtwo = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
	fxtwo.scale.set(2, 2);
	for(i in [fgfxtwo,fxtwo]){
		i.updateHitbox();
		i.antialiasing = true;
		i.screenCenter();
		i.color = FlxColor.BLACK;
	}
	fxtwo.alpha = 0.2;
	fxtwo.scrollFactor.set(0.8, 0.8);
	fxtwo.blend = BlendMode.OVERLAY;
if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);rain.data.zoom.value = [32];
	rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
}
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	rain.data.iTime.value = [time];
	ray.data.iTime.value = [time];
	glitch.data.iTime.value = [time];
}
function beatHit(curBeat) {
	if (((curStep >= 320) && (curStep <= 576))||((curStep >= 832) && (curStep <= 1088)))
		{
			for (i in 0...4)
			{ 
				for (guh in [playerStrums, cpuStrums])
				{
					var member = guh.members[i];
									
					if (curBeat % 2 == 0)
					{
						var angler = (i%1 ? 7 : -7) * ((curBeat%8==0) ? 7 : -7);
	
						FlxTween.tween(member, {y: angler + (PlayState.downscroll ? 20 : -20)},(Conductor.stepCrochet/4000), {
								onComplete: function(twn:FlxTween)
								{
									FlxTween.tween(member, {y: 20 - (PlayState.downscroll ? -10 : 10)}, 0.33, {ease: FlxEase.backOut});
								}
							});
					}
				}
			}
		}
	switch(curBeat) {
		case 48: 
		defaultCamZoom = 0.9;
		cameraSpeed = 8;
		case 80: 
		defaultCamZoom = 0.95;
		if (FlxG.save.data.rain) {rain.data.zoom.value = [35];
			rain.data.raindropLength.value = [0.075];rain.data.opacity.value = [0.2];}
		add(fxtwo);
		cameraSpeed = 0.2;
		fxtwo.camera = camOverlay;
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		case 144:
		if (FlxG.save.data.rain) {rain.data.zoom.value = [32];
			rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
		fxtwo.visible = fgfxtwo.visible = false;
		cameraSpeed = 1;
		defaultCamZoom = 0.8;
		case 204:
		defaultCamZoom = 0.9;
		case 209:
		defaultCamZoom = 0.95;
		cameraSpeed = 0.2;
		fgfxtwo.visible = fxtwo.visible = true;
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		if (FlxG.save.data.rain) {rain.data.zoom.value = [40];
			rain.data.raindropLength.value = [0.1];rain.data.opacity.value = [0.25];}
		case 272:
		cameraSpeed = 1;
		defaultCamZoom = 0.9;
		camGame.alpha = 0;
		if (FlxG.save.data.rain)rain.data.opacity.value = [0];
		camGame.visible = camHUD.visible = false;
		case 276:
		cameraSpeed = 8;
		camGame.alpha = 1;
		defaultCamZoom = 0.75;
		dad.scale.set(1.2,1.2);
		boyfriend.x += 120;
		dad.x -= 120;
		if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
		camGame.addShader(ray);
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		camGame.visible = camHUD.visible = true;
		case 308:
		defaultCamZoom = 0.85;
		case 340:
		moveing = camGame.visible = camHUD.visible = false;
//		if (FlxG.save.data.crt) {FlxG.camera.removeShader(crt);camHUD.removeShader(crt);}
		camGame.removeShader(ray);
		case 350:
		dad.angle = gf.angle = boyfriend.angle = 0;
		case 370:
		FlxTween.tween(dad, {angle: 0}, 0.2, {ease: FlxEase.linear});
		FlxTween.tween(boyfriend, {angle: 0}, 0.2, {ease: FlxEase.linear});
		FlxTween.tween(gf, {angle: 0}, 0.2, {ease: FlxEase.linear});
		if (FlxG.save.data.glitch) {camHUD.addShader(glitch);
		glitch.data.iTime.value = [2,2];glitch.data.on.value = [1.];}
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);
		}
		for (i in 0...playerStrums.members.length) playerStrums.members[i].y = defaultStrumY;
		for (i in 0...cpuStrums.members.length) cpuStrums.members[i].y = defaultStrumY;
		case 372:
//		if (FlxG.save.data.crt) {FlxG.camera.addShader(crt);camHUD.addShader(crt);}
		if (FlxG.save.data.rain){rain.data.zoom.value = [32];
			rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
		camGame.visible = camHUD.visible = fgfxtwo.visible = true;
		camGame.alpha = defaultCamZoom = cameraSpeed = 1;
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
	}
}
}