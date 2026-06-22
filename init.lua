local spawn = core.settings:get_pos("simple_spawn_pos") or -- default
              core.settings:get_pos("static_spawnpoint")   -- fallback

core.register_on_joinplayer(function(player, lastlogin)
    if lastlogin then return end
    if not spawn then
        core.log("error", "Simple Spawn: No spawn positions set.")
    end

    player:set_pos(spawn)
    return true
end)

core.register_chatcommand("spawn", {
    description = "Go to spawn.",
    func = function(name)
        local player = core.get_player_by_name(name)

        if not player then return false end
        if not spawn then return false, "No spawn positions set." end

        player:set_pos(spawn)

        return true, "Teleported to spawn."
    end
})
