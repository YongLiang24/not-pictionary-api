class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :answer
      t.references :drawer
      t.references :guesser
      t.jsonb :guesses
      t.boolean :is_active
      t.timestamps
    end
  end
end
