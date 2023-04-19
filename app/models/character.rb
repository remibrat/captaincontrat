class Character < ApplicationRecord

    has_many :characters, foreign_key: :character_id, class_name: "Fight"
    has_many :opponents, foreign_key: :opponent_id, class_name: "Fight"
 
    MAX_LP_TRESHOLD = 50
    MAX_ATK_TRESHOLD = 20

    def fights
        characters.or(opponents)
    end
end
