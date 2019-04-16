class Game < ApplicationRecord
  belongs_to :drawer, class_name: 'Player'
  belongs_to :guesser, class_name: 'Player'
end
