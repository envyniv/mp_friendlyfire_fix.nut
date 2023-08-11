//FindByClassname(handle previous, string classname)
::WorldSpawn <- Entities.FindByClassname(null, "worldspawn")

/*
IncludeScript("tf_vscript_friendlyfire/scout/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/soldier/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/pyro/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/demo/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/medic/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/heavy/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/engineer/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/sniper/main.nut", this)
IncludeScript("tf_vscript_friendlyfire/spy/main.nut", this)
*/
IncludeScript("tf_vscript_friendlyfire/_tf_projectile_jar.nut", this)

__CollectGameEventCallbacks(true)
