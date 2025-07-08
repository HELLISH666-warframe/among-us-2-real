function onCreate()
	cameraShake('game', 0.005, 150);
	cameraShake('hud', 0.005, 150);
	setPropertyFromClass('ClientPrefs', 'hideTime', false)
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.2 then
	    setProperty('health', health- 0.125)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if getProperty('health') < 1 then
	    setProperty('health', health+ 0.125)
	end
end

function onBeatHit()
	triggerEvent('Add Camera Zoom',0.00,0.06);
	doTweenZoom('Zoom', 'camHUD', 0.9, 0.15, 'linear');
	makeLuaSprite('red', 'deadly', -110, -60);
	setObjectCamera('red', 'hud');
	scaleObject('red', 0.6, 0.6);
	addLuaSprite('red', true);
	doTweenAlpha('red', 'red', 0, 0.25, 'linear')
end