var chrom = new CustomShader("chromatic aberration");
var wig = new CustomShader("glitchsmh");
var vhs = new CustomShader("vhs");
var crt = new CustomShader("fake CRT");
var time:Float = 0;
var mmtw:FlxSound = new FlxSound();
function postCreate() {

	mmtw = new FlxSound();
	mmtw = FlxG.sound.load(Paths.music('breakfast'), 0, true);
	mmtw.volume = 0;
	mmtw.play(false, FlxG.random.int(0, Std.int(mmtw.length / 2)));
		var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/titlescreen/titleThing'));
		add(bg);
		bg.screenCenter();
		bg.updateHitbox();
		bg.scale.set(2.25,2.25);
		bg.scrollFactor.set(0.1,0.1);
		bg.alpha = 0.33;

		disclaimer.text="This is a fan-build and is not to be considered offical in any regard with the content in said fan-build and is still VERY un-finshed , but it will hopefully feature scrapped content , all of 2.5 menus and all and some bonus fan-made stuff.\n it will be finshed some day.\n --earframe";

	if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
	if (FlxG.save.data.glitch) {FlxG.camera.addShader(wig);
		wig.data.on.value = [1.];
	}
	if (FlxG.save.data.vhs) FlxG.camera.addShader(vhs);
	if (FlxG.save.data.chrom) FlxG.camera.addShader(chrom);
}
function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.iTime = time;
    vhs.iTime = time;
	if (mmtw.volume < .5)  mmtw.volume += elapsed * .01;
	if (FlxG.keys.justPressed.ENTER){
		mmtw.destroy();
		FlxG.sound.play(Paths.sound('resumeSong'));
		FlxTween.tween(FlxG.camera, {zoom: 0.5, angle: 45}, 0.9, {ease: FlxEase.quadIn});
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		FlxG.switchState(new TitleState()));
	}
	if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		import funkin.editors.EditorPicker;
		openSubState(new EditorPicker());
	}
}