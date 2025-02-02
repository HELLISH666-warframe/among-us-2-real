var appearscreen:Bool = true;

public function windowSpawn():Void
	{
		var amount = curBeat/20;
		if (FlxG.random.bool(amount) && appearscreen)
		{
			var randomthing:FlxSprite = new FlxSprite(FlxG.random.int(300, 1077), FlxG.random.int(0, 622));
			FlxG.sound.play(Paths.sound("pop_up"), 1);
			randomthing.loadGraphic(Paths.image('/PopUps/popup' + FlxG.random.int(1,8)));
			randomthing.updateHitbox();
			randomthing.alpha = 0;
			randomthing.antialiasing = true;
			add(randomthing);
			randomthing.cameras = [camHUD];
			appearscreen = false;
			{
				FlxTween.tween(randomthing, {width: 1, alpha: 1}, 0.2, {ease: FlxEase.sineOut});
			}
			new FlxTimer().start(1.5 , function(tmr:FlxTimer)
			{
				appearscreen = true;
			});
			new FlxTimer().start(2 , function(tmr:FlxTimer)
			{
				remove(randomthing);
			});
		}
	}