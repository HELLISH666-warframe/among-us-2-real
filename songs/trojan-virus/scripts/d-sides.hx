if (PlayState.difficulty.toLowerCase() == 'fanmade-d'){
	var temporaryShader:CustomShader  = new CustomShader("chromatic aberration");
	var hud:Bool = false;
	var bug = new FlxTimer();
	var resetbug = new FlxTimer();
	var hudbutnot:Bool = false;
    var Chromacrap:Float = 0;
    function setChrome(chromeOffset){
		temporaryShader.data.rOffset.value = [chromeOffset * -1];
		temporaryShader.data.bOffset.value = [chromeOffset];
    }
	function boundTo(value, min, max){
    	return Math.max(min, Math.min(max, value));
	}
	function postCreate() {
		FlxG.camera.addShader(temporaryShader);
		camHUD.addShader(temporaryShader);
	    camHUD.alpha=0.001;
        camHUD.zoom=5;
	}
	function update(elapsed:Float) {
	if (Chromacrap > 100000.0025) {
        Chromacrap = Math.lerp(Chromacrap, 0, boundTo(elapsed * 10, 0, 1));
    }
	//Chromacrap = FlxG.random.int(0.00001, 1.000000001);
	setChrome(Chromacrap);
	trace(Chromacrap);
		var currentBeat2:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/170);
		if (hud)
			camGame.angle = 0 - 10  * Math.sin((currentBeat2/8) * Math.pi);
		if (hudbutnot){
			camHUD.angle = 0 - 5  * Math.sin((curStep/8) * Math.sin);
			camHUD.x = 0 - 25  * Math.sin((curStep/14+0.5) * Math.sin);
			camHUD.y = 0 - 25  * Math.sin((curStep/18+0.25) * Math.sin);
		}
	}
	function beatHit(curBeat:Int) {
		if (curBeat == 208){
		FlxTween.tween(FlxG.camera, {angle: -10}, 2, {ease: FlxEase.cubeInOut});
   	 	}
		if (curBeat == 224) {
		FlxTween.tween(FlxG.camera, {angle: 10}, 2, {ease: FlxEase.cubeInOut});
        }
		if (curBeat == 240) {
		FlxTween.tween(FlxG.camera, {angle: -10}, 2, {ease: FlxEase.cubeInOut});
    	}
		if (curBeat == 254) {
		FlxTween.tween(FlxG.camera, {angle: 0}, 0.33, {ease: FlxEase.cubeInOut});
		FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.33, {ease: FlxEase.cubeOut});
        defaultCamZoom=0.7;
    	}
		if (curBeat == 256) {
        hudbutnot = false;
		FlxTween.tween(camHUD, {angle: 0}, 2, {ease: FlxEase.cubeInOut});
		FlxTween.tween(camHUD, {x: 0}, 2, {ease: FlxEase.cubeInOut});
		FlxTween.tween(camHUD, {y: 0}, 2, {ease: FlxEase.cubeInOut});
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.6, {ease: FlxEase.cubeOut});
        defaultCamZoom=0.9;
    	}
		if (curBeat == 312) {
		FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.5, {ease: FlxEase.cubeOut});
        defaultCamZoom=0.7;
    	}
		if (curBeat == 316) {
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, 1.32, {ease: FlxEase.cubeIn});
        defaultCamZoom=1.3;
    	}
		if (curBeat == 320){
        hud = true;
        //boi = true;
	    //runTimer('glitch', 0.1)
		FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.5, {ease: FlxEase.cubeOut});
		defaultCamZoom=0.9;
		}
	}
}