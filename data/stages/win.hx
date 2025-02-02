var time:Float = 0;
var iTime:Float = 0;
var Estatic2:FlxSprite;
importScript("data/scripts/windowspam");
//FlxG.resizeWindow(width, 1180);
//FlxG.scaleMode.width = 1180;
//FlxG.scaleMode.height = 960;
//     camHUD.height = 957;
override function update(elapsed:Float){}

function create() {

}
function stepHit(curStep)
    {
        {
            if (curStep == 1)
                {
                    for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 325}, (Conductor.crochet/600), {ease: FlxEase.linear});
                    for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 650 }, (Conductor.crochet/400), {ease: FlxEase.linear});
                }
            }
        }
        function postCreate(){
            defaultCamZoom = 0.8;
            var bg:FlxSprite = new FlxSprite();
            bg.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_bg');
            bg.scale.set(4,4);
            bg.animation.addByPrefix('idle', 'bg instance 1', 24, true);
            bg.animation.play('idle');
            bg.scrollFactor.set(0.05, 0.05);
            bg.screenCenter();
            insert(1, bg);
            add(bg);
            Estatic2 = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
            Estatic2.scrollFactor.set();
            Estatic2.screenCenter();
            Estatic2.alpha = 0;
            var console:FlxSprite = new FlxSprite();
            console.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_console');
            console.scale.set(4,4);
            console.animation.addByPrefix('idle', 'ezgif.com-gif-maker (7)_gif instance 1', 24, true);
            console.animation.play('idle');
            console.scrollFactor.set(0.05, 0.05);
            console.screenCenter();
            console.alpha = 0.3;
            insert(2, console);
            add(console);
            var popup:FlxSprite = new FlxSprite();
            popup.frames = Paths.getSparrowAtlas('stages/trojan-virus/atelo_popup_animated');
            popup.scale.set(4,4);
            popup.animation.addByPrefix('idle', 'popups instance 1', 24, true);
            popup.animation.play('idle');
            popup.scrollFactor.set(0.05, 0.05);
            popup.screenCenter();
            insert(3, popup);
            add(popup);
            var lamp:FlxSprite = new FlxSprite(900, 100);
            lamp.frames = Paths.getSparrowAtlas('stages/classicStages/glitch_lamp');
            lamp.scale.set(2,2);
            lamp.animation.addByPrefix('idle', 'lamppost', 24, true);
            lamp.animation.play('idle');
            lamp.scrollFactor.set(0.9, 0.9);
            insert(4, lamp);
            add(lamp);
            var ground:FlxSprite = new FlxSprite(-537, -290).loadGraphic(Paths.image('stages/classicStages/trojan_ground'));
            ground.updateHitbox();
            ground.active = false;
            ground.antialiasing = true;
            insert(5, ground);
            add(ground);
            var error:FlxSprite = new FlxSprite(900, 550);
            error.frames = Paths.getSparrowAtlas('stages/trojan-virus/error');
            error.scale.set(2,2);
            error.animation.addByPrefix('idle', 'error instance 1', 24, true);
            error.animation.play('idle');
            error.updateHitbox();
            error.antialiasing = true;
            insert(6, error);
            add(error);
            Estatic = new FlxSprite();
            Estatic.frames = Paths.getSparrowAtlas('stages/classicStages/trojan_static');
            Estatic.scale.set(4,4);
            Estatic.animation.addByPrefix('idle', 'static instance 1', 24, true);
            Estatic.animation.play('idle');
            Estatic.scrollFactor.set();
            Estatic.screenCenter();
            insert(7, Estatic2);
            add(Estatic2);
}
function stepHit(step)
{
	{
            if ((curStep >= 538) && (Estatic2.alpha < 0.5))
				Estatic2.alpha += 0.02;
				
			if ((curStep >= 1312))
				windowSpawn();
		}}