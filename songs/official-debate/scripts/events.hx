function postCreate(){
for (i in 0...playerStrums.members.length){
		playerStrums.members[i].x -= 625;
	}

	for(i in 0...cpuStrums.members.length){
		cpuStrums.members[i].x -= 500;
	}
}

function stepHit(curStep) {
	switch(curStep) {
	    case 0:
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1200}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
		case 984:
			dad.color = FlxColor.BLACK;
			boyfriend.color = FlxColor.BLACK;
		case 1112:
		dad.color = FlxColor.WHITE;
		boyfriend.color = FlxColor.WHITE;
	}
}
