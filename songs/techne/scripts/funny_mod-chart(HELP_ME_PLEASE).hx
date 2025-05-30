/*function stepHit(curStep:Int) {
	if ((curBeat >= 40) && (curBeat < 72))
	{
		if (curStep % 16 == 0)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 25}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 0;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = 10}, 0.5, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 4)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: -25}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 0;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = -10}, 0.5, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 8)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = 10}, 0.5, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 11)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = -25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = -10}, 0.5, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 14)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = 10}, 0.5, {ease: FlxEase.quadOut});}
		}
	}
}*/