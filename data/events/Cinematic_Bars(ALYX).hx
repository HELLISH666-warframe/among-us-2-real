public var topBar:FlxSprite = new FlxSprite(-11080, -420).makeSolid(4160, 360, 0xFF000000);
public var bottomBar:FlxSprite = new FlxSprite(12080, 920).makeSolid(4160, 360, 0xFF000000);


var startValue:Int=0;
function postCreate() {

topBar.camera=camOther;
insert(0,topBar);
topBar.alpha=0.0001;

bottomBar.camera=camOther;
insert(0,bottomBar);
bottomBar.alpha=0.00001;
}

function onEvent(_) {
	if (_.event.name == 'Cinematic_Bars(ALYX)') {
		var string:Int=_.event.params[0];
		startValue = string;
		trace(startValue);
	}
}
function update(elapsed:Float) {
	if (startValue == "1"){
		FlxTween.tween(topBar, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(topBar, {y: -200}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {y: 600}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(topBar, {x: -1}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {x: -200}, 0.5, {ease: FlxEase.sineOut});
	}
	if (startValue == "2"){
		FlxTween.tween(topBar, {alpha: 0}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {alpha: 0}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(topBar, {y: -420}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {y: 920}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(topBar, {x: -11080}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bottomBar, {x: 12080}, 0.5, {ease: FlxEase.sineOut});
	}
}