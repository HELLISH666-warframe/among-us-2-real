function beatHit(curStep)
	{
		if ((curBeat >= 40) && (curBeat < 72))
	{
		if (curStep % 16 == 0)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) FlxTween.tween( guh.members[i], {angle: guh.members[i].angle = 10 }, 1, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 4)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		camHUD.x = -25;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = -10;}
		}
		if (curStep % 16 == 8)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}

		}
		if (curStep % 16 == 11)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = -25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = -10;}
		}
		if (curStep % 16 == 14)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}
		}
	}
	if ((curBeat >= 72) && (curBeat < 103))
	{
		if (curStep % 16 == 0)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.075;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 35;
		for (i in 0...1){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}

		for (i in 0...1){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 4)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		camHUD.x = -35;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = -10;}
		for (i in 0...1){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}

		for (i in 0...1){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 8)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 35;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}
		for (i in 0...1){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}

		for (i in 0...1){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}

		}
		if (curStep % 16 == 11)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = -35;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = -10;}
		for (i in 0...1){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}

		for (i in 0...1){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		}
		if (curStep % 16 == 14)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 35;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}
		for (i in 0...1){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( cpuStrums.members[i], {y: cpuStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}

		for (i in 0...1){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...2){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...3){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 75}, 1, {ease: FlxEase.quadOut});}
		for (i in 0...4){ FlxTween.tween( playerStrums.members[i], {y: playerStrums.members[i].y = 25}, 1, {ease: FlxEase.quadOut});}
		}
	}
	if ((curBeat >= 108) && (curBeat < 168))
	{
		if (curStep % 16 == 0)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.1;
		}
		if (curStep % 16 == 2)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.1;
		}
		if (curStep % 16 == 6)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.1;
		}
		if (curStep % 16 == 8)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.1;
		}
		if (curStep % 16 == 10)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.1;
		}
	}
}
/*if ((curBeat >= 40) && (curBeat < 11111))
	{
		if (curBeat % 16 == 0)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		camHUD.x = 25;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		}
		if (curBeat % 16 == 4)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = -25;
		}
		if (curBeat % 16 == 8)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
			for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}
		}
		if (curBeat % 16 == 11)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = -25;
		for (i in 0...4){
		for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = -10;}
	    }
		if (curBeat % 16 == 14)
		{
		FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
		camHUDZoom = 1.025;
		FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
		camHUD.x = 25;
		for (i in 0...4){
		for (guh in [playerStrums, cpuStrums]) guh.members[i].angle = 10;}
	}}
}*/