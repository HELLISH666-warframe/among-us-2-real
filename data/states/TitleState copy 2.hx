import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end
//yo cyber should i add anti piracy? -ekical
//like a real anti piracy thing or just a joke? -cyber
//idk do you want it to be real or a joke? -ekical
//do it if you want lol gtg bye -cyber
//lol k -ekical
//also im leaving these little comment conversatiions here because i think it funny lol -ekical

	static var initialized:Bool = false;

	var blackScreen:FlxBackdrop;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var logoBl:FlxSprite;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function create()
	{
		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

/*			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;
*/
			FlxG.sound.playMusic(Paths.music('freakyMenu2.5'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		
			FlxG.camera.zoom = 3;
			FlxG.camera.angle = 10;
			
			FlxTween.tween(FlxG.camera, {zoom: 1, angle: 0}, 1, {
				ease: FlxEase.quadInOut
			});
		}

		Conductor.changeBPM(102);
		persistentUpdate = true;


		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/2.5/titlestate/bg'));
		bg.setGraphicSize(Std.int(bg.width * 4));
		bg.setGraphicSize(Std.int(bg.height * 4));
		bg.antialiasing = true;
		bg.scrollFactor.set();
		bg.screenCenter();
		bg.active = false;
		add(bg);

	
		logoBl = new FlxSprite(-100, -90);
		logoBl.frames = Paths.getSparrowAtlas('menus/2.5/logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;

		gfDance = new FlxSprite(FlxG.width * 0.62, FlxG.height * 0.3);
		gfDance.frames = Paths.getSparrowAtlas('menus/2.5/titlestate/gfDanceTitle');
		gfDance.animation.addByPrefix('idle', "GF Dancing Beat", 24);
		gfDance.antialiasing = true;
		add(gfDance);
		add(logoBl);

		titleText = new FlxSprite(40, FlxG.height * 0.7);
		titleText.scale.set(0.7, 0.7);
		titleText.frames = Paths.getSparrowAtlas('menus/2.5/titlestate/titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		add(titleText);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/2.5/titlestate/logo'));
		logo.screenCenter();
		logo.antialiasing = true;
		// add(logo);
		
		blackScreen = new FlxBackdrop(Paths.image('menus/2.5/titlestate/scroll'), 0.2, 0.2, true, true);
		new FlxTimer().start(0.005, function(tmr:FlxTimer)
		{
			blackScreen.x += 1;
			tmr.reset(0.005);
		});
		add(blackScreen);


		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		credTextShit = new Alphabet(0, 0, "Riskerman\nCyberByte\nfunkycode-time", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menus/titlescreen/newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter();
		ngSpr.antialiasing = true;
		
		var blackeffect:FlxSprite = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
		blackeffect.updateHitbox();
		blackeffect.antialiasing = true;
		blackeffect.screenCenter();
		blackeffect.scrollFactor.set();
		add(blackeffect);
		
		FlxTween.tween(blackeffect, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: FlxEase.PINGPONG});

		FlxG.mouse.visible = false;

		if (initialized)
			skipIntro();
		else
			initialized = true;

		// credGroup.add(credTextShit);
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{

		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = controls.ACCEPT;
		var pressedSkip:Bool = false;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		if (pressedEnter && !pressedSkip && !transitioning && skippedIntro)
		{

			if (FlxG.save.data.flashing)
				titleText.animation.play('press');

			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();

			MainMenuState.firstStart = true;

			// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
		}

		if (pressedEnter && !skippedIntro && initialized)
		{
			skipIntro();
		}
		
		if (!pressedEnter && !pressedSkip && !transitioning && skippedIntro)
		{
			if (FlxG.keys.justPressed.S)
			{
				// im too tired to keep waiting for the stupid Other states so im just putting a skip button
				pressedSkip = true;
				FlxG.switchState(new ModState('MainMenu2.5'));
			}
			if (FlxG.keys.justPressed.A)
			{
				// testing purposes
				pressedSkip = true;
				FlxG.switchState(new ModState('MainMenu2.5'));
			}
		if (FlxG.keys.justPressed.A)
			{
				// testing purposes
				pressedSkip = true;
				FlxG.switchState(new ModState('AntiPiracyState'));
			}
		}

//		super.update(elapsed);
	}

	function fuckyou(){
		#if desktop
		FlxG.switchState(new ModState('MainMenu2.5'));
		#else
		 FlxG.switchState(new PiracyScreen());
		#end
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter();
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter();
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override public function stepHit():Void 
		{
			super.stepHit();
			if (curStep % 2 == 0){
				
			danceLeft = !danceLeft;
	
			gfDance.animation.play('idle');
			}
		}
		
		override function beatHit()
		{
//			super.beatHit();
			//bumpin camera :)
			//ITS COOL
			if (FlxG.camera.zoom == 1)
				FlxTween.tween(FlxG.camera, {zoom:1.025}, 0.3, {ease: FlxEase.quadOut, type: FlxEase.BACKWARD});
			logoBl.animation.play('bump',true);
			FlxG.log.add(curBeat);

		switch (curBeat)
		{
			case 1:
				createCoolText(['A', 'FUCKTON', 'OF', 'PEOPLE']);
			// credTextShit.visible = true;
			case 3:
				addMoreText('PRESENT');
			// credTextShit.text += '\npresent...';
			// credTextShit.addText();
			case 4:
				deleteCoolText();
			// credTextShit.visible = false;
			// credTextShit.text = 'In association \nwith';
			// credTextShit.screenCenter();
			case 5:
					createCoolText(['in association with']);
			case 7:
					addMoreText('not patrick');
					ngSpr.visible = true;

			// credTextShit.text += '\nNewgrounds';
			case 8:
				deleteCoolText();
				ngSpr.visible = false;
			// credTextShit.visible = false;

			// credTextShit.text = 'Shoutouts Tom Fulp';
			// credTextShit.screenCenter();
			case 9:
				createCoolText([curWacky[0]]);
			// credTextShit.visible = true;
			case 11:
				addMoreText(curWacky[1]);
			// credTextShit.text += '\nlmao';
			case 12:
				deleteCoolText();
			// credTextShit.visible = false;
			// credTextShit.text = "Friday";
			// credTextShit.screenCenter();
			case 13:
				addMoreText('LITERALLY EVERY');
			// credTextShit.visible = true;
			case 14:
				addMoreText('FANMADE FNF MOD');
			// credTextShit.text += '\nNight';
			case 15:
				addMoreText('EVER'); // credTextShit.text += '\nFunkin';

			case 16:
				skipIntro();
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			remove(credGroup);
			blackScreen.alpha = 0;
			skippedIntro = true;
		}
	}