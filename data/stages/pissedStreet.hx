var wasdark = false;
var moveing:Bool = false;
var time:Float = 0;
function postCreate() {
	truefog.screenCenter();
	insert(members.indexOf(stage.getSprite("mountains")), truefog);
	truefog.visible = false;
	fog.screenCenter();
	fog.camera = camHUD;
	remove(fog);
}
function beatHit(curBeat){
	if (PlayState.difficulty.toLowerCase() == 'hard') 
	{
	switch (curBeat)
		{
		case 340:
/*		for (i in 0...8)
			{ var member = strumLineNotes.members[i];member.y = defaultStrumY;}*/
	}
}
}
public function underwater()
{
	sky.visible = !sky.visible;
	rain3.visible = !rain3.visible;
	city.visible = !city.visible;
	mountains.visible = !mountains.visible;
	hillfront.visible = !hillfront.visible;
	rain2.visible = !rain2.visible;
	street.visible = !street.visible;
	rain1.visible = !rain1.visible;
	underwater.visible = !underwater.visible;
	moveing = !moveing;
}
function darkness()
{
	wasdark = !wasdark;
	if (wasdark == true)
	{
		for (i in stage.stageSprites) {
			FlxTween.cancelTweensOf(i, ['color']);
		}
		truefog.visible = true;
		add(fog);
		fog.color = 0xFF77ADFF;
		FlxG.camera.flash(0xFF000000, 1, null, true);
		dad.color = 0xFF000000;
		boyfriend.color = 0xFF000000;
		truefog.color = 0xFFFFFFFF;
			
		sky.color = 0xFFFFFFFF;
		city.color = 0xFFFFFFFF;
		mountains.color = 0xFF000000;
		hillfront.color = 0xFF000000;
		street.color = 0xFF000000;
		street.alpha = 0.5;
		hillfront.alpha = 0.25;
		mountains.alpha = 0.125;
			
		gf.alpha = 0.75;
		gf.color = 0xFF000000;
	}
	else
	{
		truefog.visible = false;
		remove(fog);
		var it = 0; 
		for (i in stage.stageSprites) {
			if (i.color == 0xFF000000)
				FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});
		}
		FlxTween.color(dad, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});
		for (i in [gf, boyfriend])
			FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFdbcfb3, {ease: FlxEase.circOut});

		street.alpha = hillfront.alpha = mountains.alpha = gf.alpha = 1;
	}
}
function update(elapsed) 
{
	time += elapsed;
	//for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;
	if (moveing)
	{
	for (i in 0...cpuStrums.members.length) cpuStrums.members[i].y += Math.sin((curStep+i*2)/4)/2;
	for (i in 0...playerStrums.members.length) playerStrums.members[i].y += Math.sin((curStep+i*2)/4)/2;
	boyfriend.y += Math.sin(curStep/6)/2;
	dad.y -= Math.sin(curStep/6)/2;
	gf.y += Math.sin(curStep/4)/2;
	gf.angle += 0.7;
	boyfriend.angle += Math.sin(curStep/8)/6;
	dad.angle -= Math.sin(curStep/8)/6;
	}
}
function fade()
{
	var it = 1; 
	for (i in stage.stageSprites) {
		FlxTween.color(i, (Conductor.crochet/1000) * 4.5,0xFFFFFFFF, 0xFF000000);
	}
}