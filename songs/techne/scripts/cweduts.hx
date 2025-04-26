var window:FlxSprite;
var cursor:FlxSprite;
function onSongStart() {
	FlxTween.tween(window, {x: 925}, 1, {ease: FlxEase.quadOut});
}
function postCreate(){	
	window = new FlxSprite(1400, 25).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/newCred/credWindow'));
	window.updateHitbox();
	window.antialiasing = false;
	window.scrollFactor.set(0, 0);
	add(window);
	cursor = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/newCred/credMouse'));
	cursor.updateHitbox();
	cursor.antialiasing = false;
	cursor.scrollFactor.set(0, 0);
	add(cursor);
}
function beatHit(curBeat)
{			
	if ((curBeat == 6))
	{ 
		FlxTween.tween(cursor, {x: 1090}, 0.75, {ease: FlxEase.quadOut});
		FlxTween.tween(cursor, {y: 625}, 0.75, {ease: FlxEase.quadOut});
	}
	if ((curBeat == 10))
	{ 
		FlxTween.tween(cursor.scale, {x: 1}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.tween(cursor.scale, {y: 1}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.tween(window.scale, {x: 0.95}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.tween(window.scale, {y: 0.95}, 0.25, {ease: FlxEase.quadOut});
		FlxTween.tween(window, {alpha: 0}, 0.25, {ease: FlxEase.quadOut});
		cursor.scale.set(0.9, 0.9);
	}
	if ((curBeat == 12))
	{ 
		remove(window);
		FlxTween.tween(cursor, {y: 800}, 0.5, {ease: FlxEase.quadIn});
	}
	if ((curBeat == 14))
	{ 
		remove(cursor);
	}
}