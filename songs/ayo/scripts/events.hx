function create() stage.getSprite("gradient").visible = false;
function beatHit(curBeat) {
	switch (curBeat) {
		case 32: stage.getSprite("streetnolight").visible = false;
		stage.getSprite("gradient").visible = true;
		case 96: stage.getSprite("gradient").visible = false;
		case 192: stage.getSprite("streetnolight").visible = true;
		case 256: stage.getSprite("streetnolight").visible = false;
		case 320: stage.getSprite("gradient").visible = true;
	}
}