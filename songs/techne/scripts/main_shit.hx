public var pentyVar = 0;
var owo = 0;
var owo2 = 0;
var uwu = 0.002;
var theValue = 5;
var daTingX:Bool = false;
var daTingY:Bool = false;
var daTingYSmall:Bool = false;
var hudAngle:Bool = false;
var yippee = 1;
var greyScale:CustomShader = new CustomShader("fanmade_stuff/alyxs_stuff/GreyscaleEffect");
var chromAbEffect:CustomShader = new CustomShader("fanmade_stuff/alyxs_stuff/ChromAbEffect");
var blur:CustomShader = new CustomShader("fanmade_stuff/alyxs_stuff/BlurEffect");
var bg:FlxSprite = new FlxSprite(300, -200).loadGraphic(Paths.image('stages/fan-made_stuff/alyxs_stuff/dead'));
bg.scrollFactor.set(1,1);
bg.scale.set(0.1775,2);
bg.camera=camHUD;
bg.alpha=0.5;
add(bg);
var cutoffPP:FlxSprite = new FlxSprite(-250, -250);
cutoffPP.frames = Paths.getSparrowAtlas('characters/fanmade_stuff/alyxs_stuff/cutoffPP');
cutoffPP.scrollFactor.set(0, 0);
cutoffPP.animation.addByPrefix('cutoffPP', 'cutoffPP', 18, false);
cutoffPP.updateHitbox();
cutoffPP.alpha = 0;
cutoffPP.x = -400;
cutoffPP.y = -400;
function postCreate() {
	camHUD.addShader(greyScale);
	FlxG.camera.addShader(greyScale);
	FlxG.camera.addShader(chromAbEffect);
	camHUD.addShader(chromAbEffect);
	FlxG.camera.addShader(blur);
	camHUD.addShader(blur);
	cutoffPP.camera = camOther2;
	FlxTween.color(stage.getSprite("pentycanvas"), 0.01, 0xFFFFFFFF, {ease: FlxEase.linear});

	bg.alpha = 0.5;
	stage.getSprite("stone1").alpha=0;
	stage.getSprite("stone2").alpha=0;
	stage.getSprite("stone3").alpha=0;
	stage.getSprite("foreskin").alpha=0;
	stage.getSprite("canvas").alpha=0;
	stage.getSprite("canvasclean").alpha=1;
	stage.getSprite("dead").alpha=1;
    camHUD.alpha=0;
}
function update(elapsed:Float) {
	var currentBeat2:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/170);

	if ((curBeat >= 176) && (curBeat < 300)){
        camHUD.x=0- -40 *  Math.cos((currentBeat2*0.33)*Math.PI);
        camHUD.y=0- -20 *  Math.cos((currentBeat2*0.42)*Math.PI);
    }
	if (curBeat < 548){
		stage.getSprite("canvas").angle=0 - 18 * Math.cos((currentBeat2*0.36)*Math.PI);
    }
	if (hudAngle){
		camHUD.angle=0 - -15*yippee * Math.cos((currentBeat2*0.33)*Math.PI);
    }

	stage.getSprite("building1").angle=0 - 20 * Math.cos((currentBeat2*0.36)*Math.PI);
	stage.getSprite("building2").angle=0 - -30 * Math.cos((currentBeat2*0.44)*Math.PI);
	stage.getSprite("building3").angle=0 -15 * Math.cos((currentBeat2*0.55)*Math.PI);

	if ((curBeat >= 36) && (curBeat < 548)){
        if (health > 1.6){
            owo = 0.1*0.9;
            owo2 = 0.2*0.9;
        }
        if ((health <= 1.6) && (health > 1.2)){
            owo = 0.3*0.9;
            owo2 = 0.4*0.9;
        }
        if ((health <= 1.2) && (health > 0.8)){
            owo = 0.5*0.9;
            owo2 = 0.6*0.9;
        }
        if ((health <= 0.8) && (health > 0.4)){
            owo = 0.7*0.9;
            owo2 = 0.8*0.9;
        }
        if (health <= 0.4){
            owo = 0.9*0.9;
            owo2 = 1*0.9;
        }
    }
	if (curBeat == 40){
        if (health > 0.01){
            health=health/1.015;
        }
    }
	if (curBeat <= 464)
	{     
		stage.getSprite("island").x = dad.x + 100;
		stage.getSprite("island").y = dad.y + 900;
		stage.getSprite("island2").x = boyfriend.x + 100;
		stage.getSprite("island2").y = boyfriend.y + 760;
	}
	if (curBeat >= 108){
		stage.getSprite("tree1").angle=0 -13 * Math.cos((currentBeat2*0.39)*Math.PI);
		stage.getSprite("tree2").angle=0 - -19 * Math.cos((currentBeat2*0.22)*Math.PI);
		stage.getSprite("tree3").angle=0 -17 * Math.cos((currentBeat2*0.25)*Math.PI);
		stage.getSprite("tree4").angle=0 -15 * Math.cos((currentBeat2*0.48)*Math.PI);
    }
	if ((curBeat >= 108) && (curBeat < 172)){
        dad.angle=0 -5 * Math.cos((currentBeat2*0.25)*Math.PI);
        boyfriend.angle=boyfriend.angle+5.0;
        FlxG.camera.shake(0.0075, 0.05);
        camHUD.shake(0.004, 0.05);
    }
	if ((curBeat >= 172) && (curBeat < 220)){
        FlxG.camera.shake(0.0025, 0.05);
        camHUD.shake(0.001, 0.05);
    }
    if ((curBeat >= 220) && (curBeat < 234)){
        FlxG.camera.shake(0.00125, 0.05);
        camHUD.shake(0.0005, 0.05);
    }
    if ((curBeat >= 234) && (curBeat < 300)){
        FlxG.camera.shake(0.0025, 0.05);
        camHUD.shake(0.001, 0.05);
    }
    if ((curBeat >= 300) && (curBeat < 444)){
        FlxG.camera.shake(0.000625, 0.05);
        camHUD.shake(0.00025, 0.05);
    }
    if ((curBeat >= 448) && (curBeat < 480)){
        FlxG.camera.shake(0.005, 0.05);
        camHUD.shake(0.002, 0.05);
    }
    if ((curBeat >= 480) && (curBeat < 544)){
        dad.angle=0 -5 * Math.cos((currentBeat2*0.25)*Math.PI);
        boyfriend.angle=boyfriend.angle+5.0;
    }
	if ((curBeat >= 480) && (curBeat < 556)){
        FlxG.camera.shake(0.0075, 0.05);
        camHUD.shake(0.004, 0.05);
    }
    if (stage.getSprite("kamehameha").y >= -500){
        stage.getSprite("kamehameha").y= -1250;
    }
    if ((curBeat >= 40) && (curBeat < 41)){
        if (pentyVar > 0.1){
            pentyVar = pentyVar - 0.005;
        }
    }
    if ((curBeat == 104) && (curBeat < 105)) {
        if (pentyVar < 2){
            pentyVar = pentyVar + 0.005;
        }
    }
    if ((curBeat == 172) && (curBeat < 173)){
        if (pentyVar > 0.25){
            pentyVar = pentyVar - 0.005;
        }
    }
    if ((curBeat == 218) && (curBeat < 219)){
        if (pentyVar > 0.1){
            pentyVar = pentyVar - 0.005;
        }
    }
    if ((curBeat == 232) && (curBeat < 233)){
        if (pentyVar < 0.25){
            pentyVar = pentyVar + 0.005;
        }
    }
    if (curBeat == 300){
        pentyVar = 0.05;
    }
    if ((curBeat == 444) && (curBeat < 448)){
        if (pentyVar > 0){
            pentyVar = pentyVar - 0.0025;
        }
    }
    if (curBeat == 448){
        pentyVar = 2.5;
    }
    if (curBeat == 480){
        pentyVar = 5;
    }
}
function onSongStart() {
    FlxTween.tween(camHUD, {alpha: 1}, 0.5);
    FlxTween.tween(stage.getSprite("dead"), {alpha: 0.5}, 3);
}
function onDadHit(e){
    if (curBeat >= 40){
        FlxG.camera.shake(0.00125, 0.05);
        camHUD.shake(0.000625, 0.05);
    }
    if (curBeat < 512){
        if (health > 0.1){
			health=health-uwu;
        }
    }
    if (curBeat >= 512){
        if (health > 0.175){
            health=health-uwu;
        }
    }
}
function beatHit(curBeat:Int) {
	if (curBeat == 315){
       fixed =  dad.y-50;
    }
    if (curBeat == 316){
        dad.y=fixed;
    }
    if (curBeat == 447){
        fixed=dad.y+50;
    }
    if (curBeat == 448){
        dad.y=fixed;
    }
	if ((curBeat >= 316) && (curBeat < 380)){
        if (curBeat %2 == 0){
            FlxTween.tween(topBar, {y: -200}, 0.5, {ease: FlxEase.quadOut});
            FlxTween.tween(topBar, {y: 600}, 0.5, {ease: FlxEase.quadOut});
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.quadOut});
            topBar.y=-180;
            bottomBar.y=580;
            camHUD.zoom=0.95;
        }
    }
	if (curBeat == 35)
	{ 
	FlxTween.tween(camHUD, {alpha: 0.01}, 0.1, {ease: FlxEase.quadOut});
	add(cutoffPP);
	cutoffPP.alpha = 1;
	cutoffPP.animation.play('cutoffPP');
	}
	if (curBeat == 36){
    uwu = 0.005;
	pentyVar = 0.5;
    FlxTween.tween(FlxG.camera, {zoom: 0.4}, 1.75, {ease: FlxEase.quadInOut});
    cameraSpeed = 4;
    defaultCamZoom=0.4;
    }
	if (curBeat == 37){
        cameraSpeed = 0.6;
    }
	if (curBeat == 40)
	{     
	FlxTween.tween(camHUD, {alpha: 1}, 0.1, {ease: FlxEase.quadOut});
	remove(cutoffPP);
	FlxTween.num(0, 0.005, 0.75, {ease: FlxEase.quadIn}, function(strength:FlxTween){
	chromAbEffect.data.strength.value = [strength];});
	}
	if (curBeat == 72){
    FlxTween.tween(FlxG.camera, {zoom: 0.5}, 1.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.5;
    }
	if (curBeat == 103){
    FlxTween.tween(camHUD, {alpha: 0.9}, 0.5, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.9;
    }
	if (curBeat == 104){
    pentyVar = 2;
    FlxG.camera.shake(0.005, 1.25);
    camHUD.shake(0.0025, 1.25);
	//Huh.
	FlxTween.tween(boyfriend, {y: -11800}, 1.5, {ease: FlxEase.quadIn});
    FlxTween.tween(FlxG.camera, {zoom: 0.3}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {angle: 180}, 1.25, {ease: FlxEase.quadInOut});
	FlxTween.tween(dad, {y: -12000}, 1.5, {ease: FlxEase.quadIn});
	FlxTween.tween(boyfriend, {angle: 360}, 1, {ease: FlxEase.quadIn});
	FlxTween.tween(scoreTxt, {alpha: 0}, 1.25, {ease: FlxEase.quadIn});
   // runTimer('start', 0.01)
    }
	if (curBeat == 108){
    uwu = 0.035;
    hudAngle = true;
    FlxG.sound.play(Paths.sound('fanmade/alyxs_stuff/boom'), 0.4);
    FlxTween.tween(FlxG.camera, {zoom: 1}, 5, {ease: FlxEase.linear});
    FlxTween.tween(FlxG.camera, {angle: 25}, 5, {ease: FlxEase.linear});
    FlxTween.tween(camHUD, {alpha: 1}, 0.75, {ease: FlxEase.quadOut});
    cameraSpeed = 2;
    defaultCamZoom=1.2;
    FlxG.camera.angle=0;
    dad.y=-12000;
    }
	if (curBeat == 123){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.6;
    }
    if (curBeat == 124){
    FlxTween.tween(FlxG.camera, {zoom: 1.2}, 5, {ease: FlxEase.linear});
    FlxTween.tween(FlxG.camera, {angle: -25}, 5, {ease: FlxEase.linear});
    defaultCamZoom=1.2;
    }
    if (curBeat == 139){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.6;
    }
    if (curBeat == 140){
    FlxTween.tween(FlxG.camera, {zoom: 1}, 5, {ease: FlxEase.linear});
	FlxTween.tween(FlxG.camera, {angle: 25}, 5, {ease: FlxEase.linear});
    defaultCamZoom=1.2;
    }
    if (curBeat == 155){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.25, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.quadOut});
    defaultCamZoom=0.6;
    }
	if (curBeat == 172){
    hudAngle = false;
    yippee = 0.2;
    uwu = 0.01;
    FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.quadOut});
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 1.5, {ease: FlxEase.quadOut});
    defaultCamZoom=0.6;
    FlxTween.tween(scoreTxt, {alpha: 1}, 1.25, {ease: FlxEase.quadOut});
    cameraSpeed = 1;
    boyfriend.angle=0;
    FlxG.camera.angle=0;
	FlxG.camera.x=0;
    dad.angle=0;
    dad.y=-6000;
    }
	if (curBeat == 176){
    hudAngle = true;
    }
	if (curBeat == 218){
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1.5, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.9;
    cameraSpeed = 0.6;
    for (i in 0...cpuStrums.members.length)FlxTween.tween(cpuStrums.members[i],{alpha: 0},1);
    for (i in 0...1){ FlxTween.tween(cpuStrums.members[i], {x: 420}, 0.6, {ease: FlxEase.quadOut});}
    for (i in 1...2){ FlxTween.tween(cpuStrums.members[i], {x: 530}, 0.65, {ease: FlxEase.quadOut});}
    for (i in 2...3){ FlxTween.tween(cpuStrums.members[i], {x: 640}, 0.7, {ease: FlxEase.quadOut});}
    for (i in 3...4){ FlxTween.tween(cpuStrums.members[i], {x: 750}, 0.75, {ease: FlxEase.quadOut});}

    for (i in 0...1){ FlxTween.tween(playerStrums.members[i], {x: 420}, 0.6, {ease: FlxEase.quadOut});}
    for (i in 1...2){ FlxTween.tween(playerStrums.members[i], {x: 530}, 0.65, {ease: FlxEase.quadOut});}
    for (i in 2...3){ FlxTween.tween(playerStrums.members[i], {x: 640}, 0.7, {ease: FlxEase.quadOut});}
    for (i in 3...4){ FlxTween.tween(playerStrums.members[i], {x: 750}, 0.75, {ease: FlxEase.quadOut});}
	FlxTween.num(0, 1, 0.75, {ease: FlxEase.quadIn}, function(strength:FlxTween){
	greyScale.data.strength.value = [strength];});
	FlxTween.num(0, 2, 0.75, {ease: FlxEase.quadIn}, function(strength:FlxTween){
	blur.data.strength.value = [strength];});
	FlxTween.num(0.005, 0, 0.75, {ease: FlxEase.quadIn}, function(strength:FlxTween){
	chromAbEffect.data.strength.value = [strength];});
    }
	if (curBeat == 234) {
	FlxTween.num(1, 0, 0.75, {ease: FlxEase.quadOut}, function(strength:FlxTween){
	greyScale.data.strength.value = [strength];});
	FlxTween.num(2, 0, 0.75, {ease: FlxEase.quadOut}, function(strength:FlxTween){
	blur.data.strength.value = [strength];});
	FlxTween.num(0, 0.005, 0.75, {ease: FlxEase.quadOut}, function(strength:FlxTween){
	chromAbEffect.data.strength.value = [strength];});
    for (i in 0...cpuStrums.members.length)FlxTween.tween(cpuStrums.members[i],{alpha: 1},0.5);
    for (i in 0...1){ FlxTween.tween(cpuStrums.members[i], {x: 120}, 0.6, {ease: FlxEase.quadOut});}
    for (i in 1...2){ FlxTween.tween(cpuStrums.members[i], {x: 230}, 0.65, {ease: FlxEase.quadOut});}
    for (i in 2...3){ FlxTween.tween(cpuStrums.members[i], {x: 340}, 0.7, {ease: FlxEase.quadOut});}
    for (i in 3...4){ FlxTween.tween(cpuStrums.members[i], {x: 450}, 0.75, {ease: FlxEase.quadOut});}
    
    for (i in 0...1){ FlxTween.tween(playerStrums.members[i], {x: 720}, 0.6, {ease: FlxEase.quadOut});}
    for (i in 1...2){ FlxTween.tween(playerStrums.members[i], {x: 830}, 0.65, {ease: FlxEase.quadOut});}
    for (i in 2...3){ FlxTween.tween(playerStrums.members[i], {x: 940}, 0.7, {ease: FlxEase.quadOut});}
    for (i in 3...4){ FlxTween.tween(playerStrums.members[i], {x: 1050}, 0.75, {ease: FlxEase.quadOut});}
	}
	if (curBeat == 234){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.6;
    cameraSpeed = 1;
    }
	if (curBeat == 251){
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.7;
    }
    if (curBeat == 267){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.6;
    }
    if (curBeat == 283){
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.7;
    }
	if (curBeat == 300){
    hudAngle = false;
	}
	if (curBeat == 308){
    uwu = 0.005;
    FlxTween.tween(FlxG.camera, {angle: 15}, 2.75, {ease: FlxEase.quadInOut});
	FlxTween.tween(FlxG.camera, {zoom: 1}, 2.75, {ease: FlxEase.quadIn});
    defaultCamZoom=1;
    cameraSpeed = 0.6;
    }
	if (curBeat == 448){
    uwu = 0.035;
	}
	if (curBeat == 480){
    uwu = 0.06;
    hudAngle = true;
	}
	if (curBeat == 512){
    uwu = 0.15;
	}
	if (curBeat == 548){
    uwu = 0.01;
    pentyVar = 0.05;
    hudAngle = false;
	}
	if (curBeat == 556){
    FlxTween.tween(FlxG.camera, {zoom: 0.6}, 0.75, {ease: FlxEase.quadInOut});
    defaultCamZoom=0.6;
    }
	if (curBeat == 564){
    FlxTween.tween(FlxG.camera, {zoom: 0.9}, 1, {ease: FlxEase.quadIn});
    defaultCamZoom=0.9;
    FlxTween.tween(stage.getSprite("dead"), {zoom: 1}, 1, {ease: FlxEase.quadIn});
    }
}
function stepHit(curStep:Int) {
	if (curStep == 1792){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1808){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=-20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
	if (curStep == 1818){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
        FlxTween.tween(FlxG.camera, {angle: -35}, 0.15, {ease: FlxEase.quadIn});
        FlxTween.tween(FlxG.camera, {zoom: 0.7}, 25.15, {ease: FlxEase.bounceOut});
        defaultCamZoom=0.7;
    }
	if (curStep == 1824){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=-20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1832){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1840){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=-20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1848){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1852){
        FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=-20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    if (curStep == 1856){
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.angle=20;
        FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
        camHUD.zoom=1.15;
    }
    /*if ((curBeat >= 40) && (curBeat < 72)){
        if (curStep % 16 == 0){
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.025;

            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=25;

        }
        if (curStep % 16 == 4){
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.025;

            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=-25;
        }
        if (curStep % 16 == 8){
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.025;

            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=25;
        }
        if (curStep % 16 == 11){
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.025;

            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=-25;
        }
        if (curStep % 16 == 14){
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.025;

            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=25;
        }
    }
    if ((curBeat >= 72) && (curBeat < 103)){
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=35;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=35;
        }
        if (curStep % 16 == 11) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=-35;
        }
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
            FlxTween.tween(camHUD, {x: 0}, 0.5, {ease: FlxEase.quadOut});
            camHUD.x=35;
        }
    }
    if ((curBeat >= 108) && (curBeat < 168)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 2) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 6) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 10) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 12) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 13) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
        if (curStep % 16 == 15) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.1;
        }
    }
    if ((curBeat >= 172) && (curBeat < 220)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 11) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;

        }       
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
    }
    if ((curBeat >= 236) && (curBeat < 300)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 11) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
    }
    if ((curBeat >= 464) && (curBeat < 480)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
            camHUD.angle=20;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
            camHUD.angle=-20;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
            camHUD.angle=20;
        }
        if (curStep % 16 == 12) {
            FlxTween.tween(camHUD, {angle: 0}, 0.75, {ease: FlxEase.expoOut});
            camHUD.angle=-20;
        }
    }
    if ((curBeat >= 464) && (curBeat < 476)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 12) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
    }
    if ((curBeat >= 476) && (curBeat < 480)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 2) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.05;
        }
        if (curStep % 16 == 4) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 6) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.05;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 10) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.05;
        }
        if (curStep % 16 == 12) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.15;
        }
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.75, {ease: FlxEase.expoOut});
            camHUD.zoom=1.05;
        }
    }

    if ((curBeat >= 480) && (curBeat < 548)) {
        if (curStep % 16 == 0) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 2) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 6) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 8) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 10) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 12) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 13) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 14) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
        if (curStep % 16 == 15) {
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.expoOut});
            camHUD.zoom=1.075;
        }
	}*/
}