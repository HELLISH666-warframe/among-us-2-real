import funkin.menus.FreeplayState;
if(controls.ACCEPT)
	{
		FlxG.switchState(new FreeplayState());
		FlxG.save.data.freeplaything = curSelectedMaster;
	}

import flash.text.TextField;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import lime.utils.Assets;

	var songs:Array<FreeplayState.SongMetadata> = [];

	var curSelected:Int = 0;
	var bg:FlxSprite;
	var bgScroll:FlxBackdrop;
	var fire:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];

	override function create()
	{
		FlxG.camera.setFilters([ShadersHandler.chromaticAberration]);
		var initSonglist = CoolUtil.coolTextFile(Paths.txt('masterlist'));

		for (i in 0...initSonglist.length)
		{
			var data:Array<String> = initSonglist[i].split(':');
			songs.push(new FreeplayState.SongMetadata(data[0], Std.parseInt(data[2]), data[1]));
		}

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.scale.set(0.7, 0.7);
		bg.screenCenter();
		bg.color = 0xFFE51F89;
		add(bg);
		
		bgScroll = new FlxBackdrop(Paths.image('checkerboard'), 5, 5, true, true);
		bgScroll.scrollFactor.set();
		bgScroll.screenCenter();
		bgScroll.velocity.set(50, 50);
		add(bgScroll);
		
		fire = new FlxSprite();
		fire.frames = Paths.getSparrowAtlas('escape_fire');
		fire.scale.set(4,4);
		fire.animation.addByPrefix('idle', 'fire instance 1', 24, true);
		fire.animation.play('idle');
		fire.scrollFactor.set();
		fire.screenCenter();
		fire.y += 120;
		fire.alpha = 0;
		add(fire);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false, true);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			iconArray.push(icon);
			add(icon);

		}

		intendedColor = bg.color;
		changeSelection(0);
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String)
	{
		songs.push(new FreeplayState.SongMetadata(songName, weekNum, songCharacter));
	}

	public function addWeek(songs:Array<String>, weekNum:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['dad'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);

			if (songCharacters.length != 1)
				num++;
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		bgScroll.color = bg.color;
		
		if (curSelected == 7)
			setChrome(FlxG.save.data.rgbintense/200);
		else
			setChrome(0.0);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		FlxG.watch.addQuick("beatShit", curStep);
		Conductor.songPosition = FlxG.sound.music.time;

		if (controls.UP_P)
		{
			changeSelection(-1);
		}
		if (controls.DOWN_P)
		{
			changeSelection(1);
		}
		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		
		if (controls.ACCEPT)
		{
			switch (curSelected)
			{
				case 0:
					FlxG.switchState(new NormalPlayState());
				case 1:
					FlxG.switchState(new BSidePlayState());
				case 2:
					FlxG.switchState(new ExtrasPlayState());
			}
		}
	}

function changeSelection(change:Int = 0)
{
	FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		
	curSelected += change;
		
	if (curSelected < 0)
		curSelected = songs.length - 1;
	if (curSelected >= songs.length)
		curSelected = 0;
		
	FlxG.camera.antialiasing = true;
		
	var bullShit:Int = 0;

	for (i in 0...iconArray.length)
	{
		iconArray[i].alpha = 0.6;
	}

	iconArray[curSelected].alpha = 1;

	for (item in grpSongs.members)
	{
		item.targetY = bullShit - curSelected;
		bullShit++;

		item.alpha = 0.6;

		if (item.targetY == 0)
		{
			item.alpha = 1;
		}
	}
	if (curSelected == 7)
	{
		FlxTween.cancelTweensOf(fire);
		fire.alpha = 0;
		FlxTween.tween(fire, {alpha: 0.5}, 1);
		FlxTween.cancelTweensOf(FlxG.camera);
		FlxTween.tween(FlxG.camera, {zoom: 1.05}, 0.5, {ease: FlxEase.quadInOut});
	}
	else
	{
		FlxTween.cancelTweensOf(fire);
		if (fire.alpha > 0)
		{
			FlxTween.tween(fire, {alpha: 0}, fire.alpha*2);
		}
		FlxTween.cancelTweensOf(FlxG.camera);
		FlxTween.tween(FlxG.camera, {zoom: 1}, 1, {ease: FlxEase.quadInOut});
	}
	var clr = FlxColor.YELLOW;
	switch (curSelected)
	{
		case 1:
			clr = FlxColor.RED;
		case 2:
			clr = FlxColor.WHITE;
		case 3:
			clr = FlxColor.LIME;
		case 4:
			clr = FlxColor.BLUE;
		case 5:
			clr = FlxColor.ORANGE;
		case 6:
			clr = FlxColor.MAGENTA;
		case 7:
			clr = FlxColor.BLACK;
	}	
	if(clr != intendedColor) {
		if(colorTween != null) {
			colorTween.cancel();
		}
		intendedColor = clr;
		colorTween = FlxTween.color(bg, 0.5, bg.color, intendedColor, {
			onComplete: function(twn:FlxTween) {
				colorTween = null;
			}
		});
	}
}