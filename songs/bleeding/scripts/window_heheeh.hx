
var rain:CustomShader  = new CustomShader("rain");
var windowmove:Bool = false;
var time:Float = 0;
override function update(elapsed:Float){
	time += elapsed;
	if (windowmove)
		{
			window.move(Math.round(244 * Math.sin(time * 9) + 227), Math.round(174 * Math.sin(time * 6) + 160));
		}
}
function stepHit(step)
{
	switch (step)
	{
	case 1:
		windowmove = true;
		for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 325}, (Conductor.crochet/600), {ease: FlxEase.linear});
		for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 800}, (Conductor.crochet/600), {ease: FlxEase.linear});
}
}