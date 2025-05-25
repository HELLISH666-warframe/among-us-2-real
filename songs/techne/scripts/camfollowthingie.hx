// I'm so exhausted man
var xx:Float = 1725;
var yy:Float = 1100;
var xx2:Float = 1725;
var yy2:Float = 1100;
var ofs:Float = 10;

var Intensity = 40;

var followchars:Bool = true;

var camOffX = 0;
var camOffY = 0;

var dadPos = [0,0];
var bfPos = [0,0];
var anim = strumLines.members[1].characters[0].getAnimName();
var flashSprite:FlxSprite;
function update(elapsed:Float) {
   // trace(curCameraTarget);
    flashSprite.alpha = FlxMath.lerp(flashSprite.alpha, 0, FlxMath.bound(elapsed * 9, 0, 1));
}
function postUpdate() {
    if(curCameraTarget == 0){
        switch(strumLines.members[0].characters[0].getAnimName()) {
        case "singLEFT"|"singLEFT-alt": camOffY = 0;
        camOffX = 0 - Intensity;
        case "singRIGHT"|"singRIGHT-alt":camOffY = 0;
        camOffX = Intensity;
        case "singUP"|"singUP-alt": camOffX = 0;
        camOffY = 0 - Intensity;
        case "singDOWN"|"singDOWN-alt":camOffX = 0;
        camOffY = Intensity;
        case "idle"|"idle-alt": camFollow.x = xx;
        }
    switch(strumLines.members[1].characters[0].getAnimName()) {
        case "singLEFT"|"singLEFT-alt": camOffY = 0;
        camOffX = 0 - Intensity;
        case "singRIGHT"|"singRIGHT-alt":camOffY = 0;
        camOffX = Intensity;
        case "singUP"|"singUP-alt": camOffX = 0;
        camOffY = 0 - Intensity;
        case "singDOWN"|"singDOWN-alt":camOffX = 0;
        camOffY = Intensity;
        case "idle"|"idle-alt": camFollow.x = xx;
    }
    }
}
function postCreate() {
		flashSprite = new FlxSprite(0, 0).makeGraphic(1920, 1080, 0xFFb30000);
		add(flashSprite);
		flashSprite.alpha = 0;
        flashSprite.cameras = [camHUD];
}
function beatHit(curBeat)
{
    switch (curBeat)
    {
        case 1:
            xx = 1450;
            yy = 1150;
            xx2 = 1950;
            yy2 = 1150;
        case 128:
            xx = 1725;
            yy = 1100;
            xx2 = 1725;
            yy2 = 1100;
        case 192:
            xx = 1450;
            yy = 1150;
            xx2 = 1950;
            yy2 = 1150;
        case 224:
            xx = 1725;
            yy = 1100;
            xx2 = 1725;
            yy2 = 1100;
        case 256:
            xx = 1450;
            yy = 1150;
            xx2 = 1950;
            yy2 = 1150;
        case 320:
            xx = 1725;
            yy = 1100;
            xx2 = 1725;
            yy2 = 1100;
        case 384:
            xx = 1450;
            yy = 1150;
            xx2 = 1950;
            yy2 = 1150;
        case 479:
            xx = 1725;
            yy = 1200;
            xx2 = 1725;
            yy2 = 1200;
        case 544:
            xx = 1725;
            yy = 1100;
            xx2 = 1725;
            yy2 = 1100;
        case 608:
            defaultCamZoom =0.9;
            xx = 1725;
            yy = 1200;
            xx2 = 1725;
            yy2 = 1200;
        case 672:
            xx = 1725;
            yy = 1100;
            xx2 = 1725;
            yy2 = 1100;

       // case 1039 | 1103 | 1937 | 1966 | 1994 | 2056 | 2080 | 2096 | 2111:
         //   FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.3}, 0.6, {ease: FlxEase.elasticOut});
    }
}
function getMid(value, size){
   fixSize = 0;

   if (size != null){
      fixSize = size;
    }else{
      fixSize = value;
   }
   result = value + (size / 2);

   return result;
}