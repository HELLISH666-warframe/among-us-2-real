function postCreate() 
{
	if (PlayState.difficulty.toLowerCase() == 'flip') 
	{
	}
}
function stepHit(step)
{if (PlayState.difficulty.toLowerCase() == 'flip04-26_01-35') 
{
	switch (step)
	{
	case 30:FlxTween.tween(camHUD, {angle: 15}, 0.5, {ease: FlxEase.backOut});
		FlxTween.tween(FlxG.camera, {angle: 20}, 0.4, {ease: FlxEase.backOut});
	case 32:FlxTween.tween(camHUD, {angle: 0}, 0.7, {ease: FlxEase.expoOut});
		FlxTween.tween(FlxG.camera, {angle: 0}, 0.4, {ease: FlxEase.backIn});
	}
	if ((curStep >= 384) && (curStep <= 640))
		FlxG.camera.shake(0.00625, 0.1);
	
	camHUD.shake(0.00125, 0.15);
	}
}