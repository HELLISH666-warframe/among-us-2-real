var daStrumID:Int = 0;
var noteName:FunkinText = new FunkinText(145, 687, 0, 'notes', 15, false);

function create(){
    switch(PlayState.SONG.meta.displayName){
        case 'ron':{
            noteName.text = 'RON_NOTES';
        }
        case 'wasted':{
            noteName.text = 'RON_NOTES';
        }
        case 'ayo':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bloodshed':{
            noteName.text = 'RON_NOTES';
        }
        case 'trojan-virus':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bijuu':{
            noteName.text = 'RON_NOTES';
        }
        case 'ron-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'wasted-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'Ayo-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'trojan-virus-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'rong-aisle':{
            noteName.text = 'RON_NOTES';
        }
        case 'certified-champion':{
            noteName.text = 'RON_NOTES';
        }
        case 'lights-down-remix':{
            noteName.text = 'RON_NOTES';
        }
        case 'trouble':{
            noteName.text = 'RON_NOTES';
        }
        case 'oh-my-god-hes-ballin':{
            noteName.text = 'RON_NOTES';
        }
        case 'gron':{
            noteName.text = 'RON_NOTES';
        }
        case 'cluster-funk':{
            noteName.text = 'RON_NOTES';
        }
        case 'awesome-ron':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bloodbath':{
            noteName.text = 'demon';
        }
        case 'ron-bsides':{
            noteName.text = 'evik';
        }
        case 'ron-dsides':{
            noteName.text = 'conall';
        }
        case 'Bleeding-classic'|'Bloodshed-classic'|'Bleeding':{
            noteName.text = 'ronhell';
        }
        case 'Bloodshed-legacy-redux':{
            noteName.text = 'demon';
        }
        case 'bloodlovania'|'haemorrhage'|'homicidal-lunacy':{
            noteName.text = 'sans_assets';
        }
    }
    trace(noteName.text, PlayState.SONG.meta.displayName);
}

function onNoteCreation(e) if (e.strumLineID == daStrumID) if (curSong != 'nyan') e.noteSprite = "notes/" + noteName.text;

function onStrumCreation(e) if (e.player == daStrumID) if (curSong != 'nyan') e.sprite = "notes/" + noteName.text;