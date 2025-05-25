function onEvent(_) {
	if (_.event.name == 'Set Cam Zoom') {
		var zoom:Float = Std.parseFloat(_.event.params[0]);
		var speed:Float = Std.parseFloat(_.event.params[1]);
		if(_.event.params[1]=null){defaultCamZoom=_.event.params[0];}
		FlxTween.tween(FlxG.camera, {zoom: _.event.params[0]}, _.event.params[1],{ 
			ease: FlxEase.sineInOut, onComplete: function(twn:FlxTween) 
				{defaultCamZoom= FlxG.camera.zoom;}});
	}
}