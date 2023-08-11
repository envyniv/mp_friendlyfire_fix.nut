::ProjJarThink <- function() {
  NetProps.SetPropInt(self.GetOwner().GetOwner(), "m_iTeamNum", 1);
  EntFireByHandle("worldspawn", "CallScriptFunction", "RevertTeam", -1);
  return -1;
}

::JarThink <- function() {
	local ent = Entities.FindByClassname(null, "tf_projectile_jar");
  if ((ent != null) && (ent.GetOwner() == self)) {
      AddThinkToEnt(ent, "ProjJarThink");
  }
 	return -1;
}

::FlameThink <- function()
{
	local player = self.GetOwner().GetOwner()
	local oldteam = player.GetTeam()
  NetProps.SetPropInt(player, "m_iTeamNum", 1);
  EntFireByHandle(player, "CallScriptFunction", "RevertTeam", -1);
  return -1;
}

::FlamethrowThink <- function() {
	local looking_for = "tf_flame"
  local ent = Entities.FindByClassname(null, looking_for);
  if ((ent != null) && (ent.GetOwner() == self))
    printl(looking_for+" found as "+ ent)
    //AddThinkToEnt(ent, "FlameThink");
 	return -1;
}

::PlayerPickupDaemon <- function() {
	local oldweapons = []
	for (local i = 0; i < 7; i++)
	{
	    local weapon = NetProps.GetPropEntityArray(player, "m_hMyWeapons", i);
	    if (weapon == null)
	      continue;
	    if ((oldweapon != null) && oldweapon != weapon) {
	    	oldweapon[i] = weapon
	    	printl(oldweapon+" was replaced by "+weapon);
	    }
	}
	return -1;
}

function OnGameEvent_player_spawn(params) {
	local p = GetPlayerFromUserID(params.userid);
	if (p != null) {
		if (params.team & 2) 
			//AddThinkToEnt(p, "")
			AddThinkToEnt(p, "PlayerPickupDaemon")
	}
}

function OnGameEvent_post_inventory_application(params) {
  local player = GetPlayerFromUserID(params.userid);
  if (player != null) {
    for (local weapon = player.FirstMoveChild(); weapon != null; weapon = weapon.NextMovePeer()) {
    	if (weapon.GetClassname() == "tf_viewmodel")
    		continue
      if (weapon.GetClassname() == "tf_weapon_jar") {
      	//printl(weapon)
      	AddThinkToEnt(weapon, "JarThink")
      }
      if (weapon.GetClassname() == "tf_weapon_flamethrower") {
       	//printl(weapon)
       	AddThinkToEnt(weapon, "FlamethrowThink")
      }
      if (weapon.GetClassname() == "tf_weapon_minigun") {
       	//printl(weapon)
       	AddThinkToEnt(weapon, "FlamethrowThink")
      }
    }
  }
}

//AddThinkToEnt(WorldSpawn, "Think")
