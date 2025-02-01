var time:Float = 0;
var iTime:Float = 0;
var vhs:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");

function postCreate(){}

override function update(elapsed:Float){time += elapsed;
	vhs.data.rOffset.value = [0.005*Math.sin(time)];
	vhs.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
}

function stepHit(curStep){
{

	switch(curStep){
		case 256:
			FlxG.camera.addShader(vhs);
			camHUD.addShader(vhs);
			vhs.data.rOffset.value = [1/2];
			vhs.data.gOffset.value = [0.0];
			vhs.data.bOffset.value = [1 * -1];
		case 257:
			FlxG.camera.addShader(wig);
			camHUD.addShader(wig);
			wig.data.iTime.value = [2,2];
			wig.data.on.value = [1.];
	}
}
}
