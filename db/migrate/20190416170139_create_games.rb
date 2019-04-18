class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.boolean :is_active
      t.boolean :is_won
      t.references :drawer
      t.references :guesser
      t.string :answer
      t.string :guesses, array: true
      t.timestamps
    end
  end
end
