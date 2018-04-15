#include <sourcemod>
#include <morecolors>

public OnPluginStart(){
	HookEvent("player_death",Event_player_death);
}
new victim;
new attacker;
new assister;
public Action:Event_player_death(Handle:event,String:name[],bool:Broadcast){
	victim = GetClientOfUserId(GetEventInt(event,"userid"));
	attacker = GetClientOfUserId(GetEventInt(event,"attacker"));
	assister = GetEventInt(event,"assister");
	if(attacker != victim){
		CPrintToChat(victim,"{arcana}[Conquer] {white}Your attacker had {community}%i{white} health remaining.",GetClientHealth(attacker));
	}
	
	if(assister > -1){
		CPrintToChat(victim,"{arcana}[Conquer] {white}Their assister had {community}%i{white} health remaining.",GetClientHealth(GetClientOfUserId(assister)));
	}

}
public Plugin:myinfo = {
	name = "Conquer DM Health remaining",
	author = "da_apple",
	description = "DM Health remaining",
	url = "https://steamcommunity.com/groups/conquerservers",
	version="1.0"
}