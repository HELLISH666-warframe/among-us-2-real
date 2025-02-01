import openfl.system.Capabilities;

var time:Float = 0;
var mosaic:CustomShader = new CustomShader("mosaic");
var chrom:CustomShader  = new CustomShader("chromatic aberration");

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.011*Math.sin(time)];
	chrom.data.bOffset.value = [-0.011*Math.sin(time)];
}

function stepHit(curStep){
{

	switch(curStep){
		case 779:
			FlxG.camera.addShader(mosaic);
			camHUD.addShader(mosaic);
			mosaic.data.uBlocksize.value = [5];
		case 780:
			mosaic.data.uBlocksize.value = [7];
		case 781:
			mosaic.data.uBlocksize.value = [10];
		case 782:
			mosaic.data.uBlocksize.value = [17];
		case 783:
			mosaic.data.uBlocksize.value = [23];
			FlxG.camera.addShader(chrom);
			camHUD.addShader(chrom);
			chrom.data.rOffset.value = [1/2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [1 * -1];
		case 960:
			mosaic.data.uBlocksize.value = [17];
		case 964:
			mosaic.data.uBlocksize.value = [13];
		case 967:
			mosaic.data.uBlocksize.value = [9];
		case 969:
			mosaic.data.uBlocksize.value = [5];
		case 971:
			FlxG.camera.removeShader(mosaic);
			camHUD.removeShader(mosaic);
	}
}


function hishader(){
	if (Options.gameplayShaders){
		camGame.addShader(shader1);
		camGame.addShader(shader2);
		camHUD.addShader(shader1);
	}
}
}
