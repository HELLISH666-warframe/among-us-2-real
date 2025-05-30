import openfl.display.BlendMode;
var time:Float = 0;
public var windowmovebath:Bool = false;
public var cameramoveblood:Bool = false;
public var intensecameramoveshed:Bool = false;
public var cameramovebleed:Bool = false;
public var intensecameramovebleed:Bool = false;
public var fx:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;
public var Estatic:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
Estatic.blend = BlendMode.OVERLAY;
//Estatic.setGraphicSize(2560,1440);
public var exploders:FlxSprite = new FlxSprite();
exploders.frames = Paths.getFrames("stages/hellStreet/explosion");
exploders.animation.addByPrefix("explosion", "explosion",  24, false);
exploders.scrollFactor.set(0, 0);
exploders.screenCenter();
exploders.visible = false;
add(exploders);
public var chrom:CustomShader = new CustomShader("chromatic aberration");
public var chromeOffset = (FlxG.save.data.chromeOffset/350);
public var chromeOffset2 = (((2 - health)*Math.sin(curStep/10))*FlxG.save.data.chromeOffset/350)/5;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	var currentBeat:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/60);
if (windowmovebath)
	window.move(Math.round(24 * Math.sin(currentBeat * Math.PI) + 327), Math.round(24 * Math.sin(currentBeat * 3) + 160));
if (cameramoveblood)
	{
	camHUD.angle = 11 * Math.sin((currentBeat/6) * Math.PI);
	FlxG.camera.angle = 2 * Math.sin((currentBeat/6) * Math.PI);
	}
if (intensecameramoveshed)
	{
	camHUD.angle = 11 * Math.sin((currentBeat/2) * Math.PI);
	FlxG.camera.angle = 4 * Math.sin((currentBeat/2) * Math.PI);
	}
if (cameramovebleed)
	{
	camHUD.angle = 22 * Math.sin((currentBeat/4) * Math.PI);
	FlxG.camera.angle = 4 * Math.sin((currentBeat/4) * Math.PI);
	}
if (intensecameramovebleed)
	{
	camHUD.angle = 45 * Math.sin((currentBeat/2) * Math.PI);
	FlxG.camera.angle = 9 * Math.sin((currentBeat/2) * Math.PI);
	}
}
function postCreate()
{if (curSong == 'bloodshed' && dad.curCharacter == 'bloodshedron'||curSong == 'bleeding'||curSong == 'bleeding-classic'||curSong == 'bloodshed-classic'||curSong == 'bloodbath'){
if (FlxG.save.data.chrom){FlxG.camera.addShader(chrom);camHUD.addShader(chrom);}
	add(fx);
	add(Estatic);
	FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut,type: FlxTween.PINGPONG});
}
	if (dad.curCharacter == 'hellron')
GameOverSubstate.script = 'data/scripts/gameovers/slap';
if (curStage == 'hell')Estatic.alpha = 1;
}