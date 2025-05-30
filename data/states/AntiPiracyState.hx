import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxBackdrop;
import lime.app.Application;

public var enterAccess:Int = 0;
public static var entering:Bool = false;
var bg:FlxSprite;

override function create(){
	bg = new FlxSprite().loadGraphic(Paths.image('stages/antipiracy'));
	bg.scale.set(0.5,0.5);
	bg.screenCenter();
	bg.scrollFactor.set();
	add(bg);
}

override function update(elapsed:Float){
	if (FlxG.keys.justPressed.ANY)
	{
		enterAccess = enterAccess + 1;
		FlxG.sound.play(Paths.sound('error'));
	}
	if ((enterAccess >= 50) && (entering == false))
	{		
		FlxG.switchState(new PlayState());
		PlayState.loadSong("anti-piracy copy", "hard");
	}
}
