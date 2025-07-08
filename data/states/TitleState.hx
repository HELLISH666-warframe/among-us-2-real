import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.sound.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import flixel.text.FlxTextBorderStyle;
import StringTools;

/*{

	titlex:Float,
	titley:Float,
	startx:Float,
	starty:Float,
	gfx:Float,
	gfy:Float,
	backgroundSprite:String,
	bpm:Int
}*/

	public var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];
	public var initialized:Bool = false;
	public var titlex:Float;
	public var backgroundSprite:String;

	var blackScreen:FlxSprite;
	var animScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:FlxText;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;
	var time:Float = 0;
	var chromeOffset = (FlxG.save.data.chromeOffset/350);
	var chrom:CustomShader  = new CustomShader("chromatic aberration");
	var bit:CustomShader  = new CustomShader("8bitcolor");
	var god:CustomShader  = new CustomShader("godray");
	public var curWacky:Array<String> = [];

	var logoBl:FlxSprite;
	var logoBi:FlxSprite;
	var gfDance:FlxSprite;
	var animScreen:FlxSprite;
	var titleText:FlxSprite;
	var animbarScrt:FlxBackdrop;
	var animbarScrb:FlxBackdrop;

	var titleJSON:TitleData;

	override function create():Void
	{
//		Paths.clearStoredMemory();
//		Paths.clearUnusedMemory();

		//trace(path, FileSystem.exists(path));

		/*#if (polymod && !html5)
		if (sys.FileSystem.exists('mods/')) {
			var folders:Array<String> = [];
			for (file in sys.FileSystem.readDirectory('mods/')) {
				var path = haxe.io.Path.join(['mods/', file]);
				if (sys.FileSystem.isDirectory(path)) {
					folders.push(file);
				}
			}
			if(folders.length > 0) {
				polymod.Polymod.init({modRoot: "mods", dirs: folders});
			}
		}
		#end*/

		FlxG.sound.volumeDownKeys = volumeDownKeys;
		FlxG.sound.volumeUpKeys = volumeUpKeys;
		FlxG.sound.playMusic(Paths.music('freakyMenu2.5'), 0);
		Conductor.changeBPM(102);
		//FlxG.keys.preventDefaultKeys = [TAB];

	//	curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

//		super.create();


		// IGNORE THIS!!!
		titleJSON = Json.parse(Assets.getText('data/gfDanceTitle.json'));

		if(!initialized)
		{
			persistentUpdate = true;
			persistentDraw = true;
		}

		FlxG.mouse.visible = false;

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		if (FlxG.save.data.colour) {FlxG.camera.addShader(bit);
			bit.data.enablethisbitch.value = [1.];}
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
			chrom.data.rOffset.value = [chromeOffset /2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [chromeOffset  * -1];
		}
	}

	function startIntro()
	{
		if (!initialized)
		{

			if(FlxG.sound.music == null) {
				FlxG.sound.playMusic(Paths.music('freakyMenu2.5'), 0);
			}
			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		Conductor.changeBPM(titleJSON.bpm);
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite();

		if (titleJSON.backgroundSprite != null && titleJSON.backgroundSprite.length > 0 && titleJSON.backgroundSprite != "none"){
			bg.loadGraphic(Paths.image(titleJSON.backgroundSprite));
		}else{
			bg.loadGraphic(Paths.image('menus/titlescreen/bg'));
			bg.setGraphicSize(Std.int(bg.width * 4));
			bg.setGraphicSize(Std.int(bg.height * 4));
			bg.antialiasing = true;
			bg.scrollFactor.set();
			bg.screenCenter();
			bg.active = false;
			add(bg);
		}

		// bg.antialiasing = ClientPrefs.globalAntialiasing;
		 bg.setGraphicSize(Std.int(bg.width * 0.6));
		 bg.updateHitbox();
		add(bg);

		gfDance = new FlxSprite();

		gfDance.frames = Paths.getSparrowAtlas('menus/titlescreen/gfDanceTitle');
		gfDance.animation.addByPrefix('idle', "GF Dancing Beat", 24);
//		gfDance.antialiasing = ClientPrefs.globalAntialiasing;
		gfDance.scale.set(0.5,0.5);
		gfDance.x += 320;
		gfDance.y -= 200;
		add(gfDance);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
		
		var animScreen:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/titlescreen/trueTitleBgAnimated'));
		animScreen.scale.set(2,2);
		animScreen.frames = Paths.getSparrowAtlas("menus/titlescreen/trueTitleBgAnimated");
		animScreen.animation.addByPrefix("animate animate", "animate animate", 30, true);
		animScreen.animation.play("animate animate");
		animScreen.updateHitbox();
		animScreen.screenCenter();
		animbarScrt = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarTop'), FlxAxes.X, 0, 0);
		animbarScrb = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarBottom'), FlxAxes.X, 0, 0);
		animbarScrt.screenCenter();
		animbarScrb.screenCenter();
		new FlxTimer().start(0.005, function(tmr:FlxTimer)
		{
			animbarScrb.x -= 2;
			animbarScrt.x += 2;
			tmr.reset(0.005);
		});
		add(animScreen);
		add(animbarScrt);
		add(animbarScrb);
	
		logoBi = new FlxSprite().loadGraphic(Paths.image('menus/titlescreen/trueTitleBack'));
		logoBi.updateHitbox();
		logoBi.screenCenter();	
		logoBl = new FlxSprite().loadGraphic(Paths.image('menus/titlescreen/trueTitleLogo'));
		logoBl.updateHitbox();
		logoBl.screenCenter();
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;
		titleText = new FlxSprite().loadGraphic(Paths.image('menus/titlescreen/trueTitlePlay'));
		titleText.updateHitbox();
		titleText.screenCenter();
		add(logoBi);
		add(logoBl);
//		insert(2, logoBl);
		add(titleText);
		
		blackScreen = new FlxSprite();
		blackScreen.frames = Paths.getSparrowAtlas('menus/titlescreen/titleThing');
		blackScreen.animation.addByPrefix('idle', 'idle', 24, true);
		blackScreen.animation.play('idle');
		blackScreen.scale.set(2.25,2.25);
		blackScreen.updateHitbox();
		blackScreen.screenCenter();
		blackScreen.scrollFactor.set(0.1,0.1);
		insert(9, blackScreen);
		add(blackScreen);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		credTextShit = new FlxText(0, 0, "", true);
		credTextShit.setFormat(Paths.font("w95.otf"), 60, FlxColor.WHITE, 'CENTER', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		credTextShit.bold = true;
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		var blackeffect:FlxSprite = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
		blackeffect.updateHitbox();
		blackeffect.antialiasing = true;
		blackeffect.screenCenter();
		blackeffect.scrollFactor.set();
		add(blackeffect);
		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menus/titlescreen/newgrounds_logo'));
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter();
		ngSpr.antialiasing = true;
		insert(11, ngSpr);
		add(ngSpr);

		FlxTween.tween(blackeffect, {alpha: 0}, 1, {ease: FlxEase.quadInOut});

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: FlxEase.PINGPONG});

		if (initialized)
			skipIntro();
		else
			initialized = true;

		// credGroup.add(credTextShit);
	}

	public function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('titlescreen/introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}
	var transitioning:Bool = false;
	static var playJingle:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.A)
			{
				pressedSkip = true;
				FlxG.switchState(new ModState('AntiPiracyState'));
			}
		time += elapsed;
		chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
		chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
		if (skippedIntro) {
			logoBl.angle = Math.sin(-time*5)/8;
			logoBi.angle = logoBl.angle;
			titleText.angle += Math.sin(-time*8)/16;
			bit.data.enablethisbitch.value = time/2;
			god.data.iTime.value = [-1*Math.sin(time)];
		}

		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		var pressedSkip:Bool = false;

		// EASTER EGG

		if (initialized && !transitioning && skippedIntro)
		{
			if(pressedEnter)
			{
				FlxTween.tween(titleText, {y: titleText.y - 500}, 2, {ease: FlxEase.backIn});

				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				
				FlxTween.cancelTweensOf(FlxG.camera);
				blackScreen.color = FlxColor.BLACK;
				blackScreen.scale.set(10,10);
				blackScreen.screenCenter();
				FlxTween.tween(blackScreen, {alpha: 1}, 1.1, {ease: FlxEase.circIn});
				FlxTween.tween(FlxG.camera, {zoom: 3, angle: 22}, 1.5, {ease: FlxEase.quartIn});
				FlxTween.tween(animbarScrt, {y: animbarScrt.y - 200}, 0.5, {ease: FlxEase.quadIn});
				FlxTween.tween(animbarScrb, {y: animbarScrb.y + 200}, 0.5, {ease: FlxEase.quadIn});
				FlxG.camera.fade(0xFF000000, 0.8, true);

				transitioning = true;
				// FlxG.sound.music.stop();

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					//MusicBeatState.switchState((ClientPrefs.warnings ? new substates.WarningSubState() : new menus.DesktopMenu()));
					FlxG.switchState(new ModState('DesktopState'));
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
		}

		if (initialized && pressedEnter && !skippedIntro)
		{
			skipIntro();
		}

		if (!pressedEnter && !pressedSkip && !transitioning && skippedIntro)
		{
			if (FlxG.keys.justPressed.S)
			{
				pressedSkip = true;
				FlxG.switchState(new ModState('DesktopState'));
			}
		}

//		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>, ?offset:Float = 0)
	{
		for (i in 0...textArray.length)
		{
			var money:FlxText = new FlxText(0, 0, textArray[i]);
			money.setFormat(Paths.font("w95.otf"), 60, FlxColor.WHITE, 'CENTER', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			money.bold = true;
			money.y += (i * 60) + 200 + offset;
			money.screenCenter();
			if(credGroup != null && textGroup != null) {
				credGroup.add(money);
				textGroup.add(money);
				insert(13, credGroup);
				insert(12, textGroup);
				insert(14, money);
			}
		}
	}

	public function addMoreText(text:String, ?offset:Float = 0)
	{
		if(textGroup != null && credGroup != null) {
			var coolText:FlxText = new FlxText(0, 0, text);
			coolText.setFormat(Paths.font("w95.otf"), 60, FlxColor.WHITE, 'CENTER', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
//			coolText.bold = true;
			coolText.screenCenter();
			coolText.y += (textGroup.length * 60) + 200 + offset;
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	public static var closedState:Bool = false;
	override function beatHit(curBeat:Int)
	{
//		super.beatHit();
		if (transitioning == false)
		{
			FlxG.camera.zoom = 1.03;
			FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {ease: FlxEase.circOut});

		}

/*		if(logoBl != null)
			logoBl.animation.play('bump', true);

		if(gfDance != null) {
			gfDance.animation.play('idle');
		}

*/		if(!closedState) {
			sickBeats++;
			switch (curBeat)
			{
				case 1:
					createCoolText(['A', 'FUCKTON', 'OF', 'PEOPLE']);
				case 3:
					addMoreText('PRESENT');
				case 4:
					deleteCoolText();
				case 5:
					createCoolText(['in association with']);
				case 7:
					addMoreText('not patrick');
					ngSpr.visible = true;
				case 8:
					deleteCoolText();
					ngSpr.visible = false;
				case 9:
					createCoolText([curWacky[0]]);
				case 11:
					addMoreText(curWacky[1]);
				case 12:
					deleteCoolText();
				case 13:
					addMoreText('LITERALLY EVERY');
				case 14:
					addMoreText('FANMADE FNF MOD');
				case 15:
					addMoreText('EVER');

				case 16:
					skipIntro();
			}
		}
	}

	var skippedIntro:Bool = false;
	var increaseVolume:Bool = false;
	function skipIntro():Void
	{
		if (!skippedIntro)
		{

			remove(credGroup);-
			remove(blackScreen);
			FlxG.camera.flash(FlxColor.WHITE, 4);
			FlxG.camera.addShader(god);

			skippedIntro = true;
		}
	}