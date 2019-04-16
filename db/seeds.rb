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

game_one = Game.create(drawer: pizza, guesser: roni, answer: 'Pie')
game_two = Game.create(drawer: nneka, guesser: king, answer: 'Slice of Cake')
game_three = Game.create(drawer: pizza, guesser: obinna, answer: 'Love')
game_four = Game.create(drawer: roni, guesser: carrie, answer: 'Ace of Spades')
