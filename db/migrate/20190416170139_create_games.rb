class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.boolean :is_active
      t.references :drawer
      t.references :guesser
      t.string :answer
      t.jsonb :guesses
      t.timestamps
    end
  end
end
