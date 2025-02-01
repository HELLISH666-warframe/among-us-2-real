
/**
 * ALL CREDIT GOES TO me golden freidyy har har har!
 * 
 * ok listen up
 * 
 * barPos[0] is for x offset
 * barPos[1] is for y offset
 * 
 * borderOffset[0 or 1] is for the healthBarBG only
 * 
 * hpScale is for the scale of the entire thing
 * 
 * cam is for what camera it'll be on (default is camHUD) dont mess unless yk
 * 
 * far is only temp
 */


public static var healthBardisabled:Bool = false;

function create(){
    importScript('data/scripts/coolRectBar');

    switch (curSong){
        case "file-b":
            barPos = [660,(camHUD.downscroll ? FlxG.height * 0.82 : FlxG.height * 0.82)];
            hpScale = 0.7;
            
        case "file-manipulation-b":
            barPos[0] += 500;
            barPos[1] -= 200;

        case "60-pin":
            barPos[0] += 100;
        default:
            barPos[0] += 100;
            barPos[1] -= -80;
    }
}
