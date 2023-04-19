class Fight < ApplicationRecord
    belongs_to :character, class_name: "Character"
    belongs_to :opponent, class_name: "Character"
    belongs_to :winner, class_name: "Character"
end
