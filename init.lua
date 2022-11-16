-- healdamage mod by chbinder

healdamage = {
    mod = "healdamage",
    version = "20221116",
    path = minetest.get_modpath("healdamage")
}


local S = minetest.get_translator("healdamage")



minetest.register_on_player_hpchange(function(player, hp_change, reason)

    if player and reason.type ~= "drown" and reason.type ~= "respawn" and hp_change < 0 then
        local name = player:get_player_name()
        if name then
            -- check if player has privilege to be healed
            if minetest.check_player_privs(player, {healdamage = true}) then
                local current_hp = player:get_hp()
                local damage = hp_change
                -- substracting hp_change because it is a negative value
                player:set_hp(current_hp + (damage*-1))



            end
        end
    end
end
)

-- register privilege
minetest.register_privilege(
    'healdamage',
    {
        description = (
            S("Gives player privilege which heals them when they take damage")
        ),
        }
)
