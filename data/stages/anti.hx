
import flixel.addons.display.FlxBackdrop;
var time:Float = 0;
var fish:CustomShader  = new CustomShader("fisheye1");
var time:Float = 0;
var iTime:Float = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var vhs:CustomShader  = new CustomShader("vhs");
var glitchShader:CustomShader  = new CustomShader("glitchShader");
//FlxG.resizeWindow(width, 1180);
FlxG.scaleMode.width = 880;
    FlxG.scaleMode.height = 760;
    camHUD.width = 880;
    camHUD.height = 957;
Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
function postCreate() {
	add(Estatic);
	FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});}
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.009*Math.sin(time)];
	chrom.data.bOffset.value = [-0.009*Math.sin(time)];
    glitchShader.data.iTime.value = [(Math.cos(time)/9999)+1];
    Estatic.alpha = (((2-health)/3)+0.2);
	vhs.data.iTime.value = [1*Math.sin(time)];}
function create() {
    rainbowscreen = new FlxBackdrop(Paths.image('stages/hell/hellRon_satan'), FlxAxes.XY, 0, 0);
    rainbowscreen.alpha = 0.5;
    rainbowscreen2 = new FlxBackdrop(Paths.image('stages/antipiracy'), FlxAxes.XY, 0, 0);
    rainbowscreen2.alpha = 0.5;
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
        {
            rainbowscreen.x += (Math.sin(time)/5)+9;
            rainbowscreen.y += (Math.cos(time)/5)+9;
            rainbowscreen2.x += (Math.sin(time)/5)+4;
            rainbowscreen2.y += (Math.cos(time)/5)+4;
            tmr.reset(0.005);
            rainbowscreen2.alpha = 0.9 * Math.sin((time  ) * Math.PI);
        });
        insert(members.indexOf(dad), rainbowscreen);
        add(rainbowscreen);
        insert(members.indexOf(dad), rainbowscreen2);
        add(rainbowscreen2);
        FlxTween.angle(rainbowscreen, 0, 359.99, 1.5, 
            { 
            ease: FlxEase.quadIn, 
            onComplete: function(twn:FlxTween) 
                {
                    FlxTween.angle(rainbowscreen, 0, 359.99, 0.33, { type: FlxTween.LOOPING } );
                }
            } 
            );
        if (FlxG.save.data.fish){FlxG.camera.addShader(fish);
        fish.data.MAX_POWER.value = [0.2];}
        if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);chrom.data.rOffset.value = [1/2];
        chrom.data.gOffset.value = [0.0];chrom.data.bOffset.value = [1 * -1];}
        if (FlxG.save.data.vhs){FlxG.camera.addShader(vhs);camHUD.addShader(vhs);}
        if (FlxG.save.data.glitch) {FlxG.camera.addShader(glitchShader);}
}
function stepHit(curStep)
{
    if (curStep == 1)
    {
        for (i in 0...playerStrums.members.length)FlxTween.tween(playerStrums.members[i],{x: playerStrums.members[i].x - 235},(Conductor.crochet/800),{ease: FlxEase.linear});
        for (i in 0...cpuStrums.members.length)FlxTween.tween(cpuStrums.members[i],{x: cpuStrums.members[i].x - 650 },(Conductor.crochet/400),{ease: FlxEase.linear});
    }
}