import flixel.addons.display.FlxBackdrop;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var evilTrail = null;
var time:Float = 0;
var fx:FlxSprite;
FlxG.scaleMode.width = 880;
    FlxG.scaleMode.height = 760;
    camHUD.width = 880;
    camHUD.height = 957;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
override function update(elapsed:Float){            if (FlxG.save.data.chrom) {time += elapsed;
	chrom.data.rOffset.value = [0.009*Math.sin(time)];
	chrom.data.bOffset.value = [-0.009*Math.sin(time)];}}
function postCreate() {
    var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/bobtwerked/annoyed_sky'));
    bg.setGraphicSize(Std.int(bg.width * 0.75));
    bg.scrollFactor.set(0.2,0.2);
    bg.updateHitbox();
    bg.screenCenter();
    insert(1, bg);
    add(bg);
    var sun:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/bobtwerked/annoyed_sun'));
    sun.setGraphicSize(Std.int(sun.width * 0.75));
    sun.scrollFactor.set(0.2,0.2);
    sun.updateHitbox();
    sun.screenCenter();
    insert(2, sun);
    add(sun);
    var wBackground:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/bobtwerked/annoyed_back'));
    wBackground.setGraphicSize(Std.int(wBackground.width * 0.95));
    wBackground.scrollFactor.set(0.4,0.2);
    wBackground.updateHitbox();
    wBackground.screenCenter();
    insert(3, wBackground);
    add(wBackground);
    witheredClouds = new FlxBackdrop(Paths.image('stages/bobtwerked/annoyed_cloud'), FlxAxes.X, 0, 0);
    witheredClouds.scrollFactor.set(0.2,0);
    witheredClouds.screenCenter();
    witheredClouds.scale.set(0.5,0.5);
    witheredClouds.y -= 180;
    insert(4, witheredClouds);
    add(witheredClouds);
    var ground:FlxSprite = new FlxSprite(260, -375).loadGraphic(Paths.image('stages/bobtwerked/annoyed_ground'));
    ground.scale.set(1.1,1.1);
    ground.scrollFactor.set(1,1);
    ground.updateHitbox();
    ground.screenCenter();
    insert(5, ground);
    add(ground);
    fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;
add(fx);
}
function stepHit(step)
{
//    witheredClouds.x += 2;
    switch (curStep)
    {
        case 16 | 32 | 48 | 64 | 80 | 96 | 112:
            FlxG.camera.zoom += 0.02;
            defaultCamZoom -= 0.02;
        case 127:
            defaultCamZoom = 0.75;
            case 256:
//                FlxTween.tween(blackeffect, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
//                FlxTween.tween(bgbleffect, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
                defaultCamZoom += 0.1;
        case 128 | 260 | 320 | 336 | 368:
            defaultCamZoom += 0.1;
        case 383:
            defaultCamZoom -= 0.5;
        case 448 | 464 | 480 | 496:
            defaultCamZoom += 0.12;
        case 512:
            defaultCamZoom -= 0.5;
        // drop
        case 576 | 592 | 608 | 624:
            defaultCamZoom += 0.12;
        case 640:
            defaultCamZoom -= 0.5;
        case 688:
            defaultCamZoom += 0.5;
        case 704:
            defaultCamZoom -= 0.5;
        case 720 | 736 | 752 | 760:
            defaultCamZoom += 0.12;
        case 768:
            defaultCamZoom -= 0.5;
            FlxTween.tween(fx, {alpha: 0.5}, 1, {ease: FlxEase.expoOut,});
        case 880:
            defaultCamZoom += 0.5;
        case 896:
            defaultCamZoom -= 0.4;
        case 1024:
            defaultCamZoom += 0.1;
        case 1120:
            if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);chrom.data.rOffset.value = [1/2];
                chrom.data.gOffset.value = [0.0];chrom.data.bOffset.value = [1 * -1];}
            dad.x += 80;
            dad.y += 80;
            defaultCamZoom += 0.3;
            FlxTween.tween(fx, {alpha: 1}, 8, {ease: FlxEase.expoOut,});
            for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 200 ,angle: 360}, 1, {ease: FlxEase.backOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250 ,angle: 360}, 2);
        case 1129:
            evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
			insert(members.indexOf(dad)-1, evilTrail);
        case 1216 | 1232 | 1248 | 1280:
            defaultCamZoom += 0.05;
        case 1344 | 1376:
            defaultCamZoom -= 0.2;
        case 1408:
            defaultCamZoom = 0.75;
            FlxTween.tween(fx, {alpha: 0}, 1, {ease: FlxEase.expoOut,});
    }
}