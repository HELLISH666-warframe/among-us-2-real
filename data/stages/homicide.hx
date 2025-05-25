import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(FlxG.camera.scroll.x,0,300);
function postCreate() {
    snowemitter.width = FlxG.width*1.5;
    snowemitter.velocity.set(-10, -240, 10, -320);
    snowemitter.lifespan.set(5);
    snowemitter.y = FlxG.height;
    snowemitter.acceleration.set(0, -999);

    for (i in 0...150)
    {
        var p = new FlxParticle();
        var p2 = new FlxParticle();
        var p3 = new FlxParticle();
        p.makeGraphic(12,12,FlxColor.GRAY);
        p2.makeGraphic(24,24,FlxColor.GREEN);
        p3.makeGraphic(40,40,FlxColor.YELLOW);

        snowemitter.add(p);
        snowemitter.add(p2);
        snowemitter.add(p3);
    }
    insert(0, snowemitter);
    snowemitter.start(false, 0.05);

    snowemitter.x = FlxG.camera.scroll.x -300;
    snowemitter.y = FlxG.camera.scroll.y+FlxG.height+90;
}