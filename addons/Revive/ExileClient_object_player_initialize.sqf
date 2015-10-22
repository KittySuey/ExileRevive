/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_newPlayerObject","_oldPlayerObject"];
_newPlayerObject = _this;
_oldPlayerObject = player;
player reveal [_newPlayerObject, 4];
selectPlayer _newPlayerObject;
if (_oldPlayerObject isKindOf "Exile_Unit_GhostPlayer") then 
{
	deleteVehicle _oldPlayerObject;
};
player setVariable ["ExileXM8IsOnline", (profileNamespace getVariable ["ExileEnable8GNetwork", false]), true];
enableSentences false;
enableRadio false;
player setVariable ["BIS_noCoreConversations", true];
[] call ExileClient_object_player_event_hook;
[] call ExileClient_object_player_stats_reset;
[] call ExileClient_gui_postProcessing_reset;

	// Cache player's side
 	FAR_PlayerSide = side _newPlayerObject;

 	// Clear event handler before adding it
 	//player removeAllEventHandlers "HandleDamage";

 	/*
 	-- Handled by Exile
 	player addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
 	player addEventHandler
 	[
 		"Killed",
 		{
 			// Remove dead body of player (for missions with respawn enabled)
 			_body = _this select 0;

 			[_body] spawn
 			{

 				waitUntil { alive player };
 				_body = _this select 0;
 				deleteVehicle _body;
 			}
 		}
 	];
 	*/

 	_newPlayerObject setVariable ["FAR_isUnconscious", 0, true];
 	_newPlayerObject setVariable ["FAR_isStabilized", 0, true];
 	_newPlayerObject setVariable ["FAR_isDragged", 0, true];
 	_newPlayerObject setVariable ["ace_sys_wounds_uncon", false];
 	_newPlayerObject setVariable ["FAR_isUnconsciouos", 1, true];
 	 _oldPlayerObject setVariable ["FAR_isUnconscious", 0, true];
     _oldPlayerObject setVariable ["FAR_isStabilized", 0, true];
     _oldPlayerObject setVariable ["FAR_isDragged", 0, true];
     _oldPlayerObject setVariable ["ace_sys_wounds_uncon", false];
     _oldPlayerObject setVariable ["FAR_isUnconsciouos", 1, true];
 	_name = toArray serverName;
    _name resize 14;
    /*
 	    if (toString _name == MAINSN) then
 	    {
 	    _newPlayerObject setVariable ["FAR_isUnconsciouos", 1, true];
 	    }
 	    else
 	    {
 	    _newPlayerObject setVariable ["FAR_isUnconsciouos", 0, true];
 	    };
*/
 	_newPlayerObject setCaptive false;

 	FAR_isDragging = false;

 	[_newPlayerObject] spawn FAR_Player_Actions;

true