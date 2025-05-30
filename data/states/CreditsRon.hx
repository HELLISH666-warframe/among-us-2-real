import Sys;
import Alphabetthing;
import flixel.math.FlxRandom;
import openfl.display.BitmapData; 
import funkin.backend.utils.DiscordUtil;
import flixel.text.FlxText.FlxTextAlign;
var creditJSON:Dynamic;
var nameGroup = [];
var curSelected:Int = 0;
var largePortrait:FlxSprite = new FlxSprite(800, 20).loadGraphic(Paths.image("credits/seezee"));
var dividingBar = new FlxSprite(775, 400).makeGraphic(400, 5);
var descText:FlxText = new FlxText(780-49, 425, 490, "seezee", 20);
var socialMediaText:FlxText = new FlxText(710,675,0,"Press enter to open social media link", 20);
var socialMediaFavicon:FlxSprite = new FlxSprite(1165+35, 680);
var time:Float = 0;

function create() {
	DiscordUtil.changePresence('Looking at Credits', null);
	bg = CoolUtil.loadAnimatedGraphic(new FlxSprite(340,180),Paths.image('menus/freeplay/classicbgAnimate'));
	bg.color = FlxColor.RED;
	bg.screenCenter();
	bg.scale.set(2,2);
	insert(0,bg);
	creditJSON = Json.parse(Assets.getText(Paths.json("credit")));
	for (i in 0...creditJSON.length){
		var j = new Alphabetthing(0, 100 + (150 * i), creditJSON[i].handle,true);
		j.ID = i;
		j.forceX = 100;
		nameGroup.push(j);
		add(j);
		var e = new FlxSprite().loadGraphic(Paths.image("credits/" + creditJSON[i].name));
		e.setGraphicSize(50, 50);
		e.updateHitbox();
		e.antialiasing = true;
		j.trackingSpr = e;
		add(e);
	}
	largePortrait.antialiasing = true;
	descText.alignment = FlxTextAlign.CENTER;
	var loBg = new FlxSprite(700, 0).makeSolid(999, 999, 0xFF000000);
	for(i in [loBg,socialMediaFavicon,socialMediaText,largePortrait,descText,dividingBar])
	add(i);
	socialMediaFavicon.visible = false;
	socialMediaFavicon.scale.set(1.2, 1.2);

	changeSelection(0);
}
var keyCount:Int = 0;
var antiSpam:Bool = false;
function update(elapsed:Float) {
	time += elapsed;
	if (time > 1) keyCount = 0;
	if (!antiSpam) {
		if(controls.BACK)FlxG.switchState(new ModState('DesktopState'));
		if (controls.UP_P) {changeSelection(-1);FlxG.sound.play(Paths.sound('scrollMenu'));}
		if (controls.DOWN_P) {changeSelection(1);FlxG.sound.play(Paths.sound('scrollMenu')); time = 0;}
		if (controls.DOWN_P || controls.UP_P) {dividingBar.scale.x += 0.2;time = 0;/*keyCount += 1;*/}
	}
	dividingBar.scale.x = FlxMath.lerp(dividingBar.scale.x, 1, 0.1 / (1));
	if (controls.ACCEPT && creditJSON[curSelected].social_link != null) CoolUtil.openURL(creditJSON[curSelected].social_link);
	for (j in nameGroup) {
		j.y = FlxMath.lerp(j.y, 360 + (150 * (j.ID - curSelected)), 0.1 / (1));
		if (j.text != null)
			if (!antiSpam) j.scale.set(FlxMath.lerp(j.scale.x, (4 - Math.abs(j.ID - curSelected)) * (0.3 - (j.text.length * 0.01)), 0.2 / (1)), FlxMath.lerp(j.scale.y, (4 - Math.abs(j.ID - curSelected)) * (0.3 - (j.text.length * 0.01)), 0.05 / (1)));
		j.forceX = 20+FlxMath.lerp(j.forceX, 100 + -Math.abs(25 * (j.ID - curSelected)), 0.2 / (1));
	}
}
function changeSelection(e) {
	curSelected += e;
	if (curSelected > nameGroup.length - 1) keyCount += 1;
		if (curSelected == 7 && keyCount > 30 && time < 3 && !antiSpam) {
		FlxG.camera.shake(0.05, 3, function() {
			FlxG.camera.flash();
			FlxG.sound.play(Paths.sound("boom"));
			for (i in nameGroup) {i.autoOffset = false;
				for (j in i) {j.offset.set(0,0); j.scale.set(new FlxRandom().float(0.4,2),new FlxRandom().float(0.4,2));
					FlxTween.tween(j, {x: j.x + new FlxRandom().int(-1750, 1750), y: j.y + new FlxRandom().int(-1750, 1750), angle: new FlxRandom().int(360, -360)}, 5, {ease: FlxEase.quadOut});}}
			new FlxTimer().start(5.1, function(tmr:FlxTimer) {
				FlxG.sound.play(Paths.sound("rumble"));
				FlxG.sound.play(Paths.sound("piecedTogether"));
				FlxG.camera.fade(0xFFFFFF, 3.8, false, function() {#if windows Sys.exit(0); #end});
				for (i in nameGroup) 
					for (j in i) FlxTween.tween(j, {x: new FlxRandom().float(495, 515), y: new FlxRandom().float(275, 300)}, new FlxRandom().float(1, 3), {ease: FlxEase.quintInOut});
			});
		});
		FlxG.sound.play(Paths.sound("rumble"));	
		antiSpam = true;
		for (j in nameGroup)
				j.scale.set(FlxMath.lerp(j.scale.x, (4 - Math.abs(j.ID - curSelected)) * (0.3 - (j.text.length * 0.01)), 1), FlxMath.lerp(j.scale.y, (4 - Math.abs(j.ID - curSelected)) * (0.3 - (j.text.length * 0.01)), 1));
	}
	if (new FlxRandom().bool(20 * keyCount)) FlxG.sound.play(Paths.sound("thud"));
	curSelected = (curSelected > nameGroup.length - 1 ? 0 : (curSelected < 0 ? nameGroup.length - 1 : curSelected));
	FlxG.sound.music.volume = 0.2 * (5-keyCount);
	largePortrait.loadGraphic(Paths.image("credits/" + creditJSON[curSelected].name));
	largePortrait.setGraphicSize(350, 350);
	largePortrait.updateHitbox();
	descText.text = (creditJSON[curSelected].name);
	descText.text = (creditJSON[curSelected].description);
	if (creditJSON[curSelected].social_link != null) {
		var bitmap = BitmapData.loadFromFile('http://www.google.com/s2/favicons?domain=' + creditJSON[curSelected].social_link + 'sz=32');
		bitmap.onComplete(function(bitmap) {
			socialMediaFavicon.loadGraphic(bitmap);
			socialMediaFavicon.visible = true;
		});
		socialMediaText.text = "Press enter to open social media link";
	}
	else {
		socialMediaText.text = "Theres no social media link";
		socialMediaFavicon.visible = false;
	}	
}