class Item < ApplicationRecord
    has_many :character_items

    SLOTS = {
        weapon: "Weapon",
        shield: "Shield",
    }

    scope :weapons, -> { where(:slot => SLOTS[:weapon]) }
    scope :shields, -> { where(:slot => SLOTS[:shield]) }

    def unequip!(character)
        character_item = character.character_items.find_by(item_id: id)
        character_item.destroy!
    end
end
