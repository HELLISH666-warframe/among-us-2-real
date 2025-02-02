import openfl.system.Capabilities;

var time:Float = 0;
var mosaic:CustomShader = new CustomShader("mosaic");
var chrom:CustomShader  = new CustomShader("chromatic aberration");

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.011*Math.sin(time)];
	chrom.data.bOffset.value = [-0.011*Math.sin(time)];
}

function stepHit(curStep){if (PlayState.difficulty.toLowerCase() == 'hard') 
{

			switch (curStep) {
	/*			case 460:
					dad.visible = false;
					ronAnimation.x = dad.x-140;
					ronAnimation.y = dad.y+55;
					ronAnimation.visible = true;
					ronAnimation.animation.play('idle', true);
	*/			case 507: camHUD.visible = false;
				case 513: FlxTween.tween(FlxG.camera, {zoom: 2.2}, 4);
				case 532: FlxTween.cancelTweensOf(FlxG.camera);
				case 535: FlxTween.tween(FlxG.camera, {zoom: 0.8}, 2);
				case 545: FlxTween.cancelTweensOf(FlxG.camera);
				case 544: camHUD.visible = true;
				case 560: defaultCamZoom = 1;
				case 563: defaultCamZoom = 0.88;
		/*		case 538:
					PlayStateChangeables.scrollSpeed = 3.5;
					var xx = dad.x-20;
					var yy = dad.y+60;
					remove(dad);
					dad = new Character(xx, yy, 'ateloron');
					add(dad);
					iconP2.animation.play('ateloron');
					ronAnimation.visible = false;
		*/		case 544: camHUD.visible = true;
				case 556:
					defaultCamZoom = 0.58;
					FlxTween.tween(FlxG.camera, {angle: 359.99}, 0.5, {ease: FlxEase.expoOut,});
				case 562:
					FlxTween.cancelTweensOf(FlxG.camera);
					FlxG.camera.angle = 0;
					defaultCamZoom = 0.88;
				case 816|820|824|828|848|852|856|880|884|888|892|912|916|920|924:
					FlxG.camera.angle = 5;
					defaultCamZoom += 0.0125;
					FlxG.camera.zoom += 0.0125;
				case 818|822|826|830|850|854|858|882|886|890|894|914|918|922|926:
					FlxG.camera.angle = -5;
					defaultCamZoom += 0.0125;
					FlxG.camera.zoom += 0.0125;	
				case 832|864|896:
					FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.expoOut,});
					defaultCamZoom = 0.88;			
				case 928: 
					FlxTween.tween(FlxG.camera, {angle: 0}, 0.25, {ease: FlxEase.expoOut,});
					defaultCamZoom = 0.9;
				case 1046: FlxTween.tween(camGame, {alpha: 0}, 0.25, {ease: FlxEase.expoOut,});
				case 1056:
					camGame.alpha = 1;
					if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [8];
						camHUD.addShader(mosaic);FlxG.camera.addShader(mosaic);}
				case 1302: FlxTween.tween(camGame, {alpha: 0}, 0.25, {ease: FlxEase.expoOut,});
				case 1312:
					camGame.alpha = 1;
					if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);
						chrom.data.rOffset.value = [1];chrom.data.gOffset.value = [0.0];
						chrom.data.bOffset.value = [1 * -1];}
			}
	
/*			if ((curStep >= 538) && (Estatic2.alpha < 0.5))
				Estatic2.alpha += 0.02;
				
			if ((curStep >= 1312))
				windowSpawn();
*/		}
}