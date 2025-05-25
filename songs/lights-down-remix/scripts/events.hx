var time:Float = 0;
var chrom:CustomShader = new CustomShader("chromatic aberration");
var glitch:CustomShader = new CustomShader("glitchsmh");
function postCreate(){
	wbg = new FlxSprite().makeSolid(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
    wbg.scale.set(5,5);
    wbg.alpha = 0.35;

    fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
    fx.setGraphicSize(Std.int(2560 * 0.75));
	for(i in [fx,wbg]){
		i.updateHitbox();
		i.screenCenter();
		i.scrollFactor.set();
	}
    fx.antialiasing = true;
    fx.alpha = 0.5;	
}
function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	glitch.data.iTime.value = [time];
}
function beatHit(curBeat){
	if (curBeat == 64)
	{
		if (FlxG.save.data.chrom)FlxG.camera.addShader(chrom);
		if (FlxG.save.data.glitch){FlxG.camera.addShader(glitch);
		glitch.data.on.value = [1.];
		}
		stage.getSprite("background").visible = false;
		stage.getSprite("darkbackground").alpha = 1;
		add(fx);
		add(wbg);
	}
}