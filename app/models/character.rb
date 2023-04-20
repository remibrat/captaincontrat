class Character < ApplicationRecord
    has_many :characters, foreign_key: :character_id, class_name: "Fight"
    has_many :opponents, foreign_key: :opponent_id, class_name: "Fight"

    has_many :character_items
    has_many :items, through: :character_items


    MAX_LP_TRESHOLD = 50
    MAX_ATK_TRESHOLD = 20

    def fights
        characters.or(opponents)
    end

    def lp
        self[:lp] + character_items.joins(:item).sum("items.lp")
    end

    def attack
        self[:attack] + character_items.joins(:item).sum("items.attack")
    end

    def equipped_weapon
        character_items.joins(:item).find_by(items: { slot: Item::SLOTS[:weapon] })&.item
    end
    
    def equipped_shield
        character_items.joins(:item).find_by(items: { slot: Item::SLOTS[:shield] })&.item
    end

    def get_opponents
        Character.where.not(id: id).select do |opponent|
            ((opponent.lp - lp).abs <= Character::MAX_LP_TRESHOLD &&  (opponent.attack - attack).abs <= Character::MAX_ATK_TRESHOLD)
        end
    end
end
