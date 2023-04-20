# =========================
# CHARACTER SEEDS
# =========================

Character.destroy_all

c = Character.new(
    name: "Aphrodite",
    lp: "60",
    attack: "30",
    defense: "30",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Aphrodite.png")), filename: "Aphrodite.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Ares",
    lp: "100",
    attack: "50",
    defense: "10",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Ares.png")), filename: "Ares.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Artemis",
    lp: "60",
    attack: "60",
    defense: "10",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Artemis.png")), filename: "Artemis.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Athena",
    lp: "80",
    attack: "40",
    defense: "20",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Athena.png")), filename: "Athena.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Demeter",
    lp: "150",
    attack: "20",
    defense: "50",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Demeter.png")), filename: "Demeter.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Dionysos",
    lp: "80",
    attack: "30",
    defense: "30",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Dionysos.png")), filename: "Dionysos.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Hector",
    lp: "150",
    attack: "100",
    defense: "50",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Hector.png")), filename: "Hector.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Hephaistos",
    lp: "100",
    attack: "20",
    defense: "50",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Hephaistos.png")), filename: "Hephaistos.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Hermes",
    lp: "60",
    attack: "40",
    defense: "30",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Hermes.png")), filename: "Hermes.png", content_type: "image/jpg")
c.save!

c = Character.new(
    name: "Ulysse",
    lp: "100",
    attack: "100",
    defense: "90",
)
c.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "characters", "Ulysse.png")), filename: "Ulysse.png", content_type: "image/jpg")
c.save!

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