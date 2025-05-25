public var camOther:HudCamera;
public var camOther2:HudCamera;
public var chromeOffset = (FlxG.save.data.chromeOffset/350);

function create() {
        FlxG.cameras.add(camOther2 = new HudCamera(), false);
    camOther2.bgColor = 0x00000000;
}
function postCreate() {
    	FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camOther = new HudCamera(), false);
    camOther.bgColor = 0x00000000;
    FlxG.cameras.add(camHUD, false);
}