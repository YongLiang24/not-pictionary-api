# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# pizza = Player.find_or_create_by(name: 'Pizza')
# roni = Player.find_or_create_by(name: 'Roni')
# players = ['Pizza', 'Roni', 'Nneka', 'Obinna', 'Carrie', 'King']
#
# players.each { |player| Player.find_or_create_by(name: player) }

pizza = Player.find_or_create_by(name: 'Pizza')
roni = Player.find_or_create_by(name: 'Roni')
nneka = Player.find_or_create_by(name: 'Nneka')
obinna = Player.find_or_create_by(name: 'Obinna')
carrie = Player.find_or_create_by(name: 'Carrie')
king = Player.find_or_create_by(name: 'King')

game_one = Game.find_or_create_by(drawer: pizza, guesser: roni, answer: 'Pie', guesses: [])
game_two = Game.find_or_create_by(drawer: nneka, guesser: king, answer: 'Slice of Cake', guesses: [])
game_three = Game.find_or_create_by(drawer: pizza, guesser: obinna, answer: 'Love', guesses: [])
game_four = Game.find_or_create_by(drawer: roni, guesser: carrie, answer: 'Ace of Spades', guesses: [])

game_one.is_active = true
game_one.save

game_four.is_active = true
game_four.save
