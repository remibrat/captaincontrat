class Character < ApplicationRecord
    has_many :characters, foreign_key: :character_id, class_name: "Fight"
    has_many :opponents, foreign_key: :opponent_id, class_name: "Fight"

    has_many :character_items
    has_many :items, through: :character_items

    has_one_attached :image, :dependent => :destroy

    MAX_STATS_TRESHOLD = 50

    attribute :lp, :integer, default: 100
    attribute :attack, :integer, default: 20
    attribute :defense, :integer, default: 10

    def fights
        characters.or(opponents)
    end

    def true_lp
        self[:lp] + character_items.joins(:item).sum("items.lp")
    end

    def true_attack
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
            ((true_lp + true_attack + defense) - (opponent.true_lp + opponent.true_attack + opponent.defense)).abs <= MAX_STATS_TRESHOLD
        end
    end
end
