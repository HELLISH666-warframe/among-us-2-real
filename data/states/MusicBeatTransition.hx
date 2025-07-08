//Not getting the loading screen code , lmao.
import funkin.backend.utils.WindowUtils;
import openfl.Lib;
var out = newState != null;
var mod_name = (
	["Versus Ron Legacy",
	"Versus Ron + extras",
	"Versus Ron V3 + legacy + fan-made stuff",
	"Un-named oc mod wait thats the wrong mod",
	"Versus Ron Literally Every Fan Build Ever",
	"New Super Versus Ron 1 + 2 + 3 + 4 + Fan-made Content Ultimate Deluxe Game of The Year Edition Codename Engine 2 Edition",
	"Versus Ron Legacy \"Progression Update Coming Soon\"",
	"Apollo and Bloodshed-d Fix Coming Soon",
	"Slushi Engine Port Coming Soon!",
	"How many names do i have to make ear?",
	//Idea from discord user id:"956090205738242098" they change their name too much
	"Literally Every Codename Engine Port Ever",
	//can't put a "™" why????
	"\"Extra Side Content Coming Soon\"--earframe 2025",
	"Patch Notes Coming Soon",
	"Chris Pratt.",
	"Friday Night Funkin': Psych Engine- wait i meant Codename Engine",
	"Versus Ron X B-sides oh that didn't happen , oops.",
	"Ron Brainfuck Port When?",
	//Idea from discord user "azhar_sur10"
	"Versus Ron Ultimate Meme",
	"https://youtu.be/dQw4w9WgXcQ?si=07EyO6-a_NGKb_8y",
	"\"Theres virus's embeded in the pngs!\" Dumbass-2024"])[Math.floor(Math.random() * 21)];

function create() {
	if (!out) Lib.application.window.title = mod_name+"--name is temp";
}