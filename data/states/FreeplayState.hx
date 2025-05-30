import flixel.graphics.FlxGraphic;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.chart.Chart;
import Alphabetthing;

//shaders
var time:Float = 0;
var crt = new CustomShader("fake CRT");
var chrom = new CustomShader("chromatic aberration");
var fish = new CustomShader("fisheye1");
var glitch = new CustomShader("glitchsmh");
var grey = new CustomShader("grayscale");
var vhs = new CustomShader("vhs");
var official_or_not:String;
songs = [];
songRealList = [
	["ron","wasted","ayo","bloodshed","trojan-virus","Recycle-Bin","file-manipulation","factory-reset"],
	["ron-classic","wasted-classic","ayo-classic","bloodshed-classic","trojan-virus-classic","bleeding-classic"],
	["Tutorial","bloodbath","official-debate","gron","difficult-powers","bijuu","trouble","withered-tweaked","atelophobia","holy-shit-dave-fnf","slammed","meme-machine","frosting-over","ron-b","ron-dsides","bloodshed-b-old","sabotage-remix","lights-down-remix","pretty-wacky","cheese-touch","he-hates-me","certified-champion","rong-aisle","bloodshed-legacy-redux","clusterfunk","awesome-ron","oh-my-god-hes-ballin","fardventure","triad","bleeding","haemorrhage","homicidal-lunacy","bloodlovania","anti-piracy","run","run","apollo","techne"]
];
modelist = ["MAIN","CLASSIC","EXTRAS"];
rsongsFound = songRealList[FlxG.save.data.freeplaything];
modelistt = modelist[FlxG.save.data.freeplaything];

for(s in rsongsFound)
	songs.push(Chart.loadChartMeta(s, "hard", true));
//cam
var camText = new FlxCamera();
camText.bgColor = null;

var portrait = new FlxSprite();
var portraitOverlay = new FlxSprite();
var preload = [];
var grpSongs2:FlxTypedGroup<Alphabet> = [];
var iconArray2:Array<HealthIcon> = [];
var modeText:FlxText = new FlxText(10, 10, 0, modelistt, 48);
var fanmade_text = new FlxText(540, 1, 0, official_or_not, 48);
public var enterAccess:Int = 0;
var dsides:Bool = false;
var chromeOffset = (FlxG.save.data.chromeOffset/350);
function postUpdate(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	glitch.iTime = time;
	vhs.iTime = time;

	for (i in 0...songs.length)
		grpSongs2.members[i].y += (Math.sin(i+time)/2);

	for (item in grpSongs2.members)
		item.forceX = FlxMath.lerp(item.x, 125 + (65 * (item.ID - curSelected)), lerpFix(0.1));
	portraitOverlay.y = portrait.y;
	portraitOverlay.angle = portrait.angle;
	if(controls.BACK)FlxG.switchState(new ModState('MasterFreeplayState'));
}
function update(elapsed:Float) {
	if((((curSelected == 0)&&(modelistt=="EXTRAS")&&(controls.UP_P)&&(!dsides)))){curSelected = 34;
	enterAccess++;}
	if((((curSelected == 33)&&(controls.DOWN_P)&&(!dsides)))){
		changeSelection(4, true);
	enterAccess++;}
	if (enterAccess == 17)
	dsides = true;
}

function shadering() {
    switch(songs[curSelected].displayName)
    {
		case "gron": if(FlxG.save.data.grey)FlxG.camera.addShader(grey);camText.addShader(grey);
		case "trojan-virus"|"Bleeding":glitch.on = 1.;
		default:FlxG.camera.removeShader(grey);camText.removeShader(grey);
			glitch.on = 0;
    }
	diffText.color = switch(diffText.text)
	{
		case '< COOL >':0xF00020;
		case 'STAINED'|'FANMADE-D':0x347FF1;
		default: 0xFFFFFFFF;		
	}
	fanmade_text.color = switch(diffText.text)
	{
		case 'STAINED':0x347FF1;
		default: 0xffee00;		
	}
	if ((songs[curSelected].port == 'slammed')||(songs[curSelected].port == 'oh-my-god-hes-ballin'))
	{
		portraitOverlay.loadGraphic(Paths.image('menus/freeplay/portraits/'+songs[curSelected].port+'-over'));
		portraitOverlay.updateHitbox();
		portraitOverlay.screenCenter();
		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		portraitOverlay.visible = true);
	}
	else
		new FlxTimer().start(0.16, function(tmr:FlxTimer)
		portraitOverlay.visible = false);
}
function create(){
	grpSongs2 = new FlxTypedGroup();
	add(grpSongs2);
	for (i in 0...songs.length)
	{
		var songText = new Alphabetthing(0, (70 * i) + 30, songs[i].displayName.toUpperCase(),true);
		songText.isMenuItem = true;
		songText.targetY = i;
		songText.ID = i;
		songText.camera = camText;
		grpSongs2.add(songText);
		var icon = new HealthIcon(songs[i].icon);
		icon.sprTracker = songText;

		iconArray2.push(icon);
		add(icon);
	}
	for (i in 0...iconArray2.length) remove(iconArray2[i]);
	if(curSelected >= songs.length) curSelected = 0;
	modeText.setFormat(Paths.font("w95.otf"), 48, FlxColor.WHITE);
	insert(2,modeText);

	portrait.updateHitbox();
	insert(2,portrait);
}
function postCreate() {
	FlxG.cameras.add(camText, false);
	remove(grpSongs);
	for (i in iconArray) remove(i);

	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	if(FlxG.save.data.freeplaything == 1){
		bg.frames = Paths.getSparrowAtlas('menus/freeplay/classicbgAnimate');
		FlxG.camera.addShader(vhs);
	}
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.screenCenter();

	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(490,-20), Paths.image('menus/freeplay/bar'));
	insert(3,bar);

	for (i in 0...iconArray2.length) add(iconArray2[i]);
	
		insert(4,portraitOverlay);
		scoreBG.alpha = 0.3;

	fanmade_text.setFormat(Paths.font("w95.otf"), 48, FlxColor.RED);
	fanmade_text.angle=-3;
	insert(9,fanmade_text);
			
	for (i in songs) {
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.port));
		graphic.persist = true;
		preload.push(graphic);
	}
	changeSelection(0, true);
	if (FlxG.save.data.glitch)FlxG.camera.addShader(glitch);
	if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
	if (FlxG.save.data.chrom) FlxG.camera.addShader(chrom);
	camText.addShader(fish);
	fish.MAX_POWER = 0.2;
	var coolemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolemitter.velocity.set(0, -5, 0, -10);
	coolemitter.y = FlxG.height;

	var coolzemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolzemitter.velocity.set(0, 5, 0, 10);

	for (i in 0...150)
	{
		var p = new FlxParticle();
		var p2 = new FlxParticle();
		p.makeGraphic(6,6,FlxColor.BLACK);
		p2.makeGraphic(12,12,FlxColor.BLACK);

		coolemitter.add(p);
		coolemitter.add(p2);
		coolzemitter.add(p);
		coolzemitter.add(p2);
	}
	for(i in [coolzemitter,coolemitter]){
		i.width = FlxG.width*1.5;
		i.angularVelocity.set(-10, 10);
		i.lifespan.set(5);
		add(i);
		i.start(false, 0.05);
	}
}
function onChangeSelection(event) {
	if (event.change == 0) event.playMenuSFX = false;
	FlxTween.globalManager.completeTweensOf(portrait);
	var val = event.value;
	//I_know_this_is_dumb_but_dont_know_how_to_do_it_in_a_NON-dumb_way
	FlxTween.tween(scoreText, {y: scoreText.y + 0}, 0.00000000000000001, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween){
			fanmade_text.text=songs[curSelected].version;
		var bullShit:Int = 0;

		for (i in grpSongs2)
			{
				i.targetY = bullShit - curSelected;
				bullShit++;
				i.alpha = 0.6;
				if (i.targetY == 0) i.alpha = 1;
			}

		for (i in 0...iconArray2.length)
			iconArray2[i].alpha = 0.6;
	
		iconArray2[curSelected].alpha = 1;
		shadering();}});
	FlxTween.tween(portrait, {y: portrait.y + 45, angle: 5}, 0.2, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {
		portrait.loadGraphic(preload[val]);
		portrait.screenCenter();
		var mfwY = portrait.y;
		portrait.y -= 20;
		portrait.angle = -5;
		FlxTween.tween(portrait, {y: mfwY, angle: 0}, 0.4, {ease: FlxEase.elasticOut});
	}});
}
public static function lerpFix(value:Float) {return value / (60 / 60);}