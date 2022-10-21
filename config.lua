Config = {}

-- Vous pouvez créé infiniment de commande tp suffit juste de copié collé une ligne en dessous !
Config.tp = {
    {nameCommand = "tppc", perm = {"superadmin", "admin"}, pos = vector3(216.501, -810.3992, 30.6952)},
    {nameCommand = "tphp", perm = {"superadmin", "admin"}, pos = vector3(299.80, -590.33, 43.28)},
    {nameCommand = "tpf", perm = {"superadmin", "admin"}, pos = vector3(408.61026000977, -1625.4699707031, 29.291940689087)},
}


-- Ne rien rajouter dedans (possible de changé nameCommand et perm) !
Config.tp2 = {
    {nameCommand = "tp", perm = {"superadmin", "admin"}, b = "tp"}, -- permet de tp a un joueur (ne pas toucher au b MAIS il est possible de touché au commandName)
    {nameCommand = "tpa", perm = {"superadmin", "admin"}, b = "tpa"}, -- permet de se tp a un joueur (ne pas toucher au b MAIS il est possible de touché au commandName)
}