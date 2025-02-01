
import flixel.addons.display.FlxBackdrop;
var time:Float = 0;
var rainbowscreen:FlxBackdrop;
var rainbowscreen2:FlxBackdrop;
var fish:CustomShader  = new CustomShader("fisheye1");
var time:Float = 0;
var iTime:Float = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var vhs:CustomShader  = new CustomShader("vhs");
//FlxG.resizeWindow(width, 1180);
FlxG.scaleMode.width = 1180;
FlxG.scaleMode.height = 960;
     camHUD.height = 957;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.009*Math.sin(time)];
	chrom.data.bOffset.value = [-0.009*Math.sin(time)];
	vhs.data.iTime.value = [1*Math.sin(time)];}
function create() {
    rainbowscreen = new FlxBackdrop(Paths.image('stages/triad/majin'), FlxAxes.XY, 0, 0);
    rainbowscreen.alpha = 0.5;
    rainbowscreen2 = new FlxBackdrop(Paths.image('stages/triad/majinother'), FlxAxes.XY, 0, 0);
    rainbowscreen2.alpha = 0.5;
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
        {
            rainbowscreen.x += (Math.sin(time)/5)+5;
            rainbowscreen.y += (Math.cos(time)/5)+2;
            rainbowscreen2.x += (Math.sin(time)/5)+5;
            rainbowscreen2.y += (Math.cos(time)/5)+2;
            tmr.reset(0.005);
            rainbowscreen2.alpha = 0.9 * Math.sin((time  ) * Math.PI);
        });
        insert(members.indexOf(dad), rainbowscreen);
        add(rainbowscreen);
        insert(members.indexOf(dad), rainbowscreen2);
        add(rainbowscreen2);
        FlxG.camera.addShader(fish);
        fish.data.MAX_POWER.value = [0.2];
        FlxG.camera.addShader(chrom);
        chrom.data.rOffset.value = [1/2];
        chrom.data.gOffset.value = [0.0];
        chrom.data.bOffset.value = [1 * -1];
        FlxG.camera.addShader(vhs);
        camHUD.addShader(vhs);
}
function stepHit(curStep)
    {
        {
            if (curStep == 1)
                {
                    for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 325}, (Conductor.crochet/600), {ease: FlxEase.linear});
                    for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 650 }, (Conductor.crochet/400), {ease: FlxEase.linear});
                }
                if (curStep == 256)
                {FlxG.camera.flash(FlxColor.WHITE, 1);}
            }
        }