
import flixel.addons.display.FlxBackdrop;
var time:Float = 0;
var fish:CustomShader  = new CustomShader("fisheye1");
var time:Float = 0;
var iTime:Float = 0;
//FlxG.resizeWindow(width, 1180);
FlxG.scaleMode.width = 1180;
FlxG.scaleMode.height = 960;
     camHUD.height = 957;
     Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
function postCreate() {
	add(Estatic);
	FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});}
override function update(elapsed:Float){time += elapsed;}
function create() {
    rainbowscreen = new FlxBackdrop(Paths.image('stages/Screen Shot 2023-10-09 at 1.47.36 am'), FlxAxes.XY, 0, 0);
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
        {
            rainbowscreen.x += (Math.sin(time)/5)+9;
            rainbowscreen.y += (Math.cos(time)/5)+9;
            tmr.reset(0.005);
        });
        insert(members.indexOf(dad), rainbowscreen);
        add(rainbowscreen);
        camHUD.addShader(fish);
        FlxG.camera.addShader(fish);
        fish.data.MAX_POWER.value = [0.2];
}
function stepHit(curStep)
    {
        {
            if (curStep == 1)
                {
                    for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 125}, (Conductor.crochet/800), {ease: FlxEase.linear});
                    for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 50 }, (Conductor.crochet/400), {ease: FlxEase.linear});
                }
            }
        }