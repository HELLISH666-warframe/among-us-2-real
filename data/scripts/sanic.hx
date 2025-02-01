import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;
import flixel.ui.FlxBar;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

var rainbow:CustomShader = new CustomShader('rainbow');
var ratingTxt:FlxText;
var ratingTxtTimeout = 0;
var rTmarkerFormat:FlxTextFormat = new FlxTextFormat(0xFFFFFFFF);
var rTmarkerPair:FlxTextFormatMarkerPair = new FlxTextFormatMarkerPair(rTmarkerFormat, "[w]");

// var hit:FlxSound = FlxG.sound.load(Paths.sound("sanic/sanicHit"));
// newRatingsVisible = false;
// thanks yasher - abyss}
function postCreate() {
	PlayState.instance.comboGroup.visible = false;
	for (i in [accuracyTxt, missesTxt, scoreTxt])
		i.setFormat(Paths.font("comic.ttf"), 19, null, null, FlxTextBorderStyle.OUTLINE, 0xFF000000);
	healthBarBG.loadGraphic(Paths.image('game/hud/bloodbath/healthbar'));
	healthBarBG.screenCenter(FlxAxes.X);
	if (downscroll) {
		healthBarBG.y = healthBar.y - 12;
	} else {
		healthBarBG.y = healthBar.y - 15;
	}
	healthBar.scale.set(0.76, 1.13);
	iconP1.antialiasing = false;
	iconP2.antialiasing = false;

	add(ratingTxt = new FlxText(0, 0, 0, " "));
	ratingTxt.cameras = [camHUD];
	ratingTxt.setFormat(Paths.font('comic.ttf'), 32, 0xFFFFFFFF, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF000000);
	ratingTxt.screenCenter(FlxAxes.X);
	ratingTxt.y = healthBarBG.y - 35;
}