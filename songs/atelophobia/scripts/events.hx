var time:Float = 0;
var vhs:CustomShader  = new CustomShader("chromatic aberration");

override function update(elapsed:Float){time += elapsed;
	vhs.data.rOffset.value = [0.005*Math.sin(time)];
	vhs.data.bOffset.value = [-0.005*Math.sin(time)];}

function postCreate(){	   
	camHUD.addShader(vhs);
	FlxG.camera.addShader(vhs);
	vhs.data.rOffset.value = [3/2];
	vhs.data.gOffset.value = [0.0];
	vhs.data.bOffset.value = [3 * -1];}



function beatHit(curBeat){


function hishader(){
	if (Options.gameplayShaders){
		camGame.addShader(shader1);
		camGame.addShader(shader2);
		camHUD.addShader(shader1);
	}
}
}
