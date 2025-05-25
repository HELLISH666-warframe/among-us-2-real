/*if (PlayState.difficulty.toLowerCase() == 'fanmade-d'){
	var hud:Bool = false;
	var bug = new FlxTimer();
	var resetbug = new FlxTimer();
	var hudbutnot:Bool = false;
    var Chromacrap = 0;
    function setChrome(chromeOffset){
        setShaderFloat("temporaryShader", "rOffset", chromeOffset * -1);
        setShaderFloat("temporaryShader", "gOffset", 0.0);
        setShaderFloat("temporaryShader", "bOffset", chromeOffset);
    }
	function postCreate() {
	    camHUD.alpha=0.001;
        camHUD.zoom=5;
	}
	function update(elapsed:Float) {
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
		if (curBeat == 30)
		{
		bug.start(0.5,onTimerCompleted('bug'));
		}
	}
	function onTimerCompleted(tag){
    	if (tag == 'bug') {
        	if ((curBeat >= 30) && (curBeat < 320)) {
			bug.start(FlxG.random.int(0.5, 3),onTimerCompleted('bug'));
			resetbug.start(0.05,alpha_shit());
			alpha_shit();
        	}
		}
	}
}*/