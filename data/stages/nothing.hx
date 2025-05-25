var scanlines:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/nothing/scanlines'));
scanlines.antialiasing = false;
scanlines.active = false;
scanlines.scrollFactor.set();
scanlines.screenCenter();
scanlines.scale.set(4,4);
FlxTween.tween(scanlines, {alpha: 0.5}, 0.5, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
function postCreate()
    wbg.color = FlxColor.BLACK;
function beatHit(beat)
{
    switch (beat)
    {
        case 192:
        insert(members.indexOf(graadienter), scanlines); 
        graadienter.color = wbg.color = FlxColor.fromRGB(224,224,224);
        case 320:
        remove(scanlines);
        graadienter.color = wbg.color = FlxColor.fromRGB(255,255,255);
    }
}