class Player < ApplicationRecord
  has_many :drawing_games, class_name: 'Game', foreign_key: 'game_id'
  has_many :guessing_games, class_name: 'Game', foreign_key: 'game_id'

  validates :name,
    uniqueness: {
      message: ->(object, data) do
        "Hi #{object.name}!, #{data[:value]} is taken already!"
      end
    }
end
