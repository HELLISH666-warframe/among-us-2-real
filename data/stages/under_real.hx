var haemorrhageCallback:Void->Void;
var undertaleStep:Int = 0;
var undertaleGotHit:Bool = false;
var heart:FlxSprite;
var fx:FlxSprite;
var allStrums = [];
function postCreate() {
    for (i in cpuStrums.members){allStrums.push(i);}
    for (i in playerStrums.members) {allStrums.push(i);}
    camHUD.alpha = 0;
    blackeffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
    blackeffect.updateHitbox();
    blackeffect.antialiasing = true;
    blackeffect.screenCenter();
    blackeffect.scrollFactor.set();
    blackeffect.alpha = 1;
    add(blackeffect);
    heart = new FlxSprite();
    heart.frames = Paths.getSparrowAtlas('characters/utHeart');
    heart.animation.addByPrefix('idle', 'idle', 24, false);
    heart.animation.play('idle');
    heart.scrollFactor.set(1,1);
    heart.screenCenter();
    heart.alpha = 0;
    heart.scale.set(0.75,0.75);
    add(heart);
    fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
    fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
    fx.updateHitbox();
    fx.antialiasing = true;
    fx.screenCenter();
    fx.scrollFactor.set(0, 0);
    fx.alpha = 0.5;
    add(fx);
    dad.x -= 60;
    boyfriend.x += 20;
    boyfriend.y += 30;
    //startCountdown();
    healthBarBG.alpha = 0;
    healthBar.alpha = 0;
    iconP1.visible = true;
    iconP2.visible = true;
    iconP2.alpha = 0;
    iconP1.alpha = 0;
}
function stepHit(curStep:Int) {
    switch (curStep) {
        case 0:
            camHUD.alpha = 0;
        case 1:
            heart.x = boyfriend.x+boyfriend.width/2;
            heart.y = boyfriend.y+boyfriend.height/2;
            heart.alpha = 0;
            heart.antialiasing = false;
            FlxTween.tween(blackeffect, {alpha: 0}, 10);
        case 128:
            defaultCamZoom += 0.1;
        case 240:
            defaultCamZoom += 0.1;
        case 248|250:
            blackeffect.alpha = 1;
            heart.alpha = 1;
        case 249|251:
            blackeffect.alpha = 0;
            heart.alpha = 0;
        case 252:
            heart.alpha = 1;
           // blackeffect.alpha = 1;
            FlxTween.tween(heart, { x: FlxG.camera.scroll.x+((FlxG.width / 2) - (heart.width / 2)), y: FlxG.camera.scroll.y+((FlxG.height / 1.5) - (heart.height / 2))}, 0.25, {ease: FlxEase.quartOut});
        case 256:
            FlxG.camera.flash(FlxColor.WHITE, 1);
            /*rtriggerEventNote('Change Character', 'dad', 'utRon');
            triggerEventNote('Change Character', 'bf', 'heartlo');
            FlxG.camera.follow(null);// using this instead of scroll factor for physics and collision*/
            FlxG.camera.scroll.set();
            remove(dad);
            remove(boyfriend);
            add(dad);
            add(boyfriend);
            dad.scale.set(5,5);
            boyfriend.scale.set(0.75,0.75);
            boyfriend.screenCenter();
            dad.screenCenter();
            boyfriend.y = heart.y+780;
            dad.x += 92;
            heart.alpha = 0;
            var bg:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('stages/undertale_real/buttons'));
            bg.scrollFactor.set(1,1);
            bg.antialiasing = false;
            bg.screenCenter();
            bg.scale.set(0.66,0.66);
            add(bg);
            //for (i in unspawnNotes) {i.camera = camGame;}	
            for (i in playerStrums.members) {i.camera = camGame;
                remove(i);
                add(i);
                i.x += 290;
                i.alpha = 0;
            }
            haemorrhageCallback = function() {
                if (FlxG.keys.pressed.UP)boyfriend.y -= 15;
                if (FlxG.keys.pressed.DOWN)boyfriend.y += 15;
                if (FlxG.keys.pressed.LEFT)boyfriend.x -= 15;
                if (FlxG.keys.pressed.RIGHT)boyfriend.x += 15;
                if (curStep > undertaleStep + 20){undertaleGotHit = false;boyfriend.alpha = 1;}
                else boyfriend.alpha = 0.3;
                /*FlxG.overlap(allStrums, boyfriend, function(note, bf){
                    if (!undertaleGotHit) {
                        FlxG.sound.play(Paths.sound("damage"));
                        health -= 0.2;
                        undertaleStep = curStep;
                        undertaleGotHit = true;
                    }
                });*/
            }
            /*remove(notes);
            notes = new FlxTypedGroup<Note>();
            notes = new FlxTypedGroup();
            add(notes);*/
        case 480:
         //   var ogY = strumLineNotes.members[1].y;
            for (i in playerStrums.members){
                i.y = 0;
                FlxTween.tween(i, {y: playerStrums.members[i].y, alpha:1}, 3, {ease: FlxEase.quintOut});
            }
    }
}
function update(elapsed:Float) {
    if (haemorrhageCallback != null) haemorrhageCallback();
}
function onPlayerMiss(event){
    if (!undertaleGotHit) {
        FlxG.sound.play(Paths.sound("damage"));
        health -= 0.2;
        undertaleStep = curStep;
        undertaleGotHit = true;
    }
}