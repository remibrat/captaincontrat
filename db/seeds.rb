# =========================
# CHARACTER SEEDS
# =========================

Character.destroy_all

Character.create!([{
    name: "Brutus",
    lp: "60",
    attack: "10"
},
{
    name: "Michael Jackson",
    lp: "50",
    attack: "20"
},
{
    name: "Bruce Willis",
    lp: "100",
    attack: "35"
}])

# =========================
# ITEM SEEDS
# =========================

Item.destroy_all

Item.create!([{
    name: "Épée en bois",
    slot: Item::SLOTS[:weapon],
    attack: "5",
    lp: "0"
},
{
    name: "Épée en fer",
    slot: Item::SLOTS[:weapon],
    attack: "10",
    lp: "0"
},
{
    name: "Épée en obsidienne",
    slot: Item::SLOTS[:weapon],
    attack: "20",
    lp: "0"
},
{
    name: "Bouclier en bois",
    slot: Item::SLOTS[:shield],
    attack: "0",
    lp: "10"
},
{
    name: "Bouclier en fer",
    slot: Item::SLOTS[:shield],
    attack: "0",
    lp: "20"
},
{
    name: "Bouclier en titane",
    slot: Item::SLOTS[:shield],
    attack: "0",
    lp: "50"
}])

# =========================