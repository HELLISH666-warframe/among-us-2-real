/*if (PlayState.difficulty.toLowerCase() == 'fanmade-d'){

	var startSnowBalling:Bool = true;

	var blizzard:Bool = true;
	var chanceOfSnow:Int = 500;
	var velocity_bliz = [4000, 500];

	var existingSnow = 0;
	var allSnow = [];
	function update(elapsed:Float) {
		var currentBeat2:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/170);
		if ((startSnowBalling) && (FlxG.random.bool(chanceOfSnow))){
			existingSnow = existingSnow + 1;
			allSnow.push(existingSnow);
			var snowParticles:FlxSprite = new FlxSprite(camGame.width / 2 * 1.2, boyfriend.y - 75);
            snowParticles.frames = Paths.getSparrowAtlas('stages/fan-made_stuff/alyxs_stuff/newstaged/rainParticles');
			for (i in [1, 6]) {
            snowParticles.animation.addByPrefix('snow'+i, 'snow'+i, 24, true);
			snowParticles.animation.addByPrefix('snow2', 'snow2', 24, true);
			snowParticles.animation.addByPrefix('snow3', 'snow3', 24, true);
			snowParticles.animation.addByPrefix('snow4', 'snow4', 24, true);
			snowParticles.animation.addByPrefix('snow5', 'snow5', 24, true);
			snowParticles.animation.addByPrefix('snow6', 'snow6', 24, true);
			}
			snowParticles.x=snowParticles.x+FlxG.random.int(-1000, -1050);
			snowParticles.scale.set(5 + FlxG.random.int(0, 2),5 + FlxG.random.int(0, 2));
			snowParticles.velocity.y=500;
			snowParticles.scale.x= 10;
			snowParticles.scale.y= 2;
            snowParticles.angle= Math.random(0, 360);
            snowParticles.animation.play('snow'+FlxG.random.int(1, 6));
			//snowParticles.animation.play('snow'+FlxG.random.int(1, 6));
			//snowParticles.camera=camHUD;
            insert(20,snowParticles);
			trace("so_cool");

			if (!blizzard){
            if (FlxG.random.bool(50)) {
				snowParticles.velocity.x=100;
            //}else{snowParticles.velocity.x-100;
            }else{
				snowParticles.x=snowParticles.x + FlxG.random.int(-10000, 10000);
				snowParticles.velocity.x=velocity_bliz[1] * Math.cos((currentBeat2*0.001)*Math.PI);
				snowParticles.velocity.y=velocity_bliz[2];
        }
    }
		}
	}
}*/