import funkin.editors.ui.UIState;
import funkin.backend.utils.WindowUtils;
import funkin.backend.system.Main;
import funkin.menus.MainMenuState;
import funkin.menus.TitleState;
import lime.app.Application;
import funkin.backend.scripting.ModState;
import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import lime.graphics.Image;
import Type;

function new() {   
    
    if (FlxG.save.data.glitch == null) FlxG.save.data.glitch = true;
    if (FlxG.save.data.chrom == null) FlxG.save.data.chrom = true;
    if (FlxG.save.data.chromeOffset == null) FlxG.save.data.chromeOffset = 0.5;
    if (FlxG.save.data.mosaic == null) FlxG.save.data.mosaic = true;
    if (FlxG.save.data.crt == null) FlxG.save.data.crt = true;
    if (FlxG.save.data.colour == null) FlxG.save.data.colour = true;
    if (FlxG.save.data.fish == null) FlxG.save.data.fish = true;
    if (FlxG.save.data.legacy == null) FlxG.save.data.legacy = true;
    if (FlxG.save.data.vhs == null) FlxG.save.data.vhs = true;
    if (FlxG.save.data.rain == null) FlxG.save.data.rain = true;
    
    if (FlxG.save.data.pussy == null) FlxG.save.data.pussy = true;
    if (FlxG.save.data.warning == null) FlxG.save.data.warning = true;
    if (FlxG.save.data.flashing == null) FlxG.save.data.flashing = true;
    if (FlxG.save.data.dev == null) FlxG.save.data.dev = false;
}
public static var chromeOffset = (FlxG.save.data.chromeOffset/350);
function update() {
    FlxG.autoPause = false;
    Main.framerateSprite.codenameBuildField.text = "FAN_BUILD ";
    if (FlxG.keys.justPressed.F6) {
FlxG.bitmap.clearCache();
FlxG.bitmap._cache.clear();
Paths.tempFramesCache.clear();
FlxG.resetState();
}
}
window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
var redirectStates:Map<FlxState, String> = [

    //MainMenuState => "DesktopState"
    TitleState => "TitleState"
];

function preStateSwitch() {
//    if (FlxG.save.data.legacy) {
//		FlxG.game._requestedState = new ModState('MainMenu2.5"');
//	}
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}