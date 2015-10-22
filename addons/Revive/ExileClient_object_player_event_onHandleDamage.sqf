/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious", "_bodyPart"];

	_unit = _this select 0;
	_bodyPart = _this select 1;
	_amountOfDamage = _this select 2;
	//systemChat format["Original Damage: %1", _amountOfDamage];
	_killer = _this select 3;
	_isUnconscious = _unit getVariable ["FAR_isUnconscious", 0];
	// 26K - Added body part check - Script was checking hits on arms and legs causing early KIAs.
	// && _bodyPart in ["","head_hit","body"]
	if (_isUnconscious == 0) then
	{
        if (alive _unit && _amountOfDamage >= 0.9 && _isUnconscious == 0 && _bodyPart in ["","head_hit","body"]) then
        {
            _unit setDamage 0;
            _unit allowDamage false;
            _amountOfDamage = 0;
            _unit setVariable ["realKiller", _killer, true];
            //_unit setVariable ["ExileIsDead",true,true];
            [_unit, _killer] spawn FAR_Player_Unconscious;

            //credit points
            //[_unit, _killer] call ExileServer_object_player_event_onMpKilled;
            //_unit allowDamage true;
            _unit setVariable ["FAR_SendMessage", 1, true];
        }
        else
        {
        _amountOfDamage = _amountOfDamage * 0.75;
        };
	}
	else
	{
	    if (_bodyPart in ["head_hit"]) then
	    {
	    //EXECUTION
	    _unit setDamage 1;
	    _amountOfDamage = 1;
	    }
	    else
	    {
	    _amountOfDamage = 0;
	    _amountOfDamage = 0;
	    };
	};
   // systemChat format["New Damage: %1", _amountOfDamage];
	_amountOfDamage