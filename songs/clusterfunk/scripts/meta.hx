function postCreate() {
	camHUD.height += 60;
	camGame.zoom = 0.6;
}
function beatHit(curBeat) {
	if (curBeat > 35) {
		if (curBeat == 36)
			camZoomingInterval = 1;
		FlxTween.cancelTweensOf(camHUD);
		camHUD.angle = -5 + (10 * curBeat % 2);
		FlxTween.tween(camHUD, {y: -50, angle: 0}, (Conductor.crochet / 1000) / 2, {ease: FlxEase.circOut, onComplete: function() {
			FlxTween.tween(camHUD, {y: 0, angle: 0}, (Conductor.crochet / 1000) / 2, {ease: FlxEase.quartIn});
		}
		});
		camGame.zoom += 0.05;
	}
}
function flash() camHUD.flash();