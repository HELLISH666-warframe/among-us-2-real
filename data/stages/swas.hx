
import flixel.addons.display.FlxBackdrop;
var time:Float = 0;
var rainbowscreen:FlxBackdrop;
var fish:CustomShader  = new CustomShader("fisheye1");
var time:Float = 0;
var iTime:Float = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
//FlxG.resizeWindow(width, 1180);
FlxG.scaleMode.width = 1180;
FlxG.scaleMode.height = 960;
     camHUD.height = 957;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.009*Math.sin(time)];
	chrom.data.bOffset.value = [-0.009*Math.sin(time)];}
function create() {
    rainbowscreen = new FlxBackdrop(Paths.image('stages/placeholder/swas'), FlxAxes.XY, 0, 0);
    rainbowscreen.alpha = 0.5;
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
        {
            rainbowscreen.x += (Math.sin(time)/5)+9;
            tmr.reset(0.005);
        });
        insert(members.indexOf(dad), rainbowscreen);
        add(rainbowscreen);
        FlxG.camera.addShader(fish);
        fish.data.MAX_POWER.value = [0.2];
        if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);chrom.data.rOffset.value = [1/2];
        chrom.data.gOffset.value = [0.0];chrom.data.bOffset.value = [1 * -1];}
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
                healthBarBG.angle = healthBar.angle =90;
                iconP2.angle = iconP1.angle = 90;
                iconP2.x = iconP1.x = 90;
                rightBar.angle = 90;
                leftBar.angle = 90;
                comboGroup.angle = 90;
                hpBorder.angle = 90;
                healthBar.x = 600;
                healthBarBG.x = 600;
                hpBorder.x = 1000;
                leftBar.x = 1000;
                rightBar.x = 1000;
        }