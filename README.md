# ExileRevive

## Install

### First Step

Go into your mission.pbo and drop the "addons" and "FAR_revive" folder in the ordner.

 

### Second Step

Open config.cpp and search for 

```
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/
}; 
```
and add this 2 codes between      */     and    };
```
ExileClient_object_player_event_onHandleDamage = "addons\Revive\ExileClient_object_player_event_onHandleDamage.sqf";
ExileClient_object_player_initialize = "addons\Revive\ExileClient_object_player_initialize.sqf";
```
it need look like this now
```
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/
        ExileClient_object_player_event_onHandleDamage = "addons\Revive\ExileClient_object_player_event_onHandleDamage.sqf";
        ExileClient_object_player_initialize = "addons\Revive\ExileClient_object_player_initialize.sqf";
};    
```

## Last Step

 

Add the "init.sqf" to your MPMisson folder or add the line

`call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";`
to it.

Repack your Mission.pbo 


Done now you have a working revive script on your server.


ps. You need a medikit to revive a player !!!
