
pizza = Player.find_or_create_by(name: 'Pizza')
roni = Player.find_or_create_by(name: 'Roni')
nneka = Player.find_or_create_by(name: 'Nneka')
obinna = Player.find_or_create_by(name: 'Obinna')
carrie = Player.find_or_create_by(name: 'Carrie')
king = Player.find_or_create_by(name: 'King')

game_one = Game.find_or_create_by(drawer: pizza, guesser: roni, answer: 'Pie', guesses: [], name: 'Finding David')
game_two = Game.find_or_create_by(drawer: nneka, guesser: king, answer: 'Slice of Cake', guesses: [], name: 'Family Dinner')
game_three = Game.find_or_create_by(drawer: pizza, guesser: obinna, answer: 'Love', guesses: [], name: 'Jazzagals')
game_four = Game.find_or_create_by(drawer: roni, guesser: carrie, answer: 'Ace of Spades', guesses: [], name: 'Moira vs Town Council')
game_four = Game.find_or_create_by(drawer: roni, guesser: carrie, answer: 'Ace of Spades', guesses: [], name: 'Moira vs Town Council')



game_one.is_active = true
game_one.save

game_four.is_active = true
game_four.save
