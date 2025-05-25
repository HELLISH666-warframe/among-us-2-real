if (PlayState.difficulty.toLowerCase() == 'v4') 
	{
function beatHit(curBeat) {
	if ((curBeat >= 80) && (curBeat < 143)||(curBeat >= 210) && (curBeat < 270))
	{
		for (i in 0...4)
		{ 
			for (guh in [playerStrums, cpuStrums])
			{
				var member = guh.members[i];
								
				if (curBeat % 2 == 0)
				{
					var angler = (i%2 ? 10 : -10) * ((curBeat%4==2) ? -1 : 1);

					FlxTween.tween(member, {angle: angler, y: member.y + (PlayState.downscroll ? 10 : -10)}, 0.125, {
							ease: FlxEase.quartIn,
							onComplete: function(twn:FlxTween)
							{
								FlxTween.tween(member, {angle: 0, y: member.y - (PlayState.downscroll ? 10 : -10)}, 0.33, {ease: FlxEase.circInOut});
							}
						});
				}
			}
		}
	}
	}
}