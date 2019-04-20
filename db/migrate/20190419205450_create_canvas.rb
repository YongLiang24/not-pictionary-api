class CreateCanvas < ActiveRecord::Migration[5.2]
  def change
    create_table :canvas do |t|
      t.timestamps
      t.integer :currentGameId
      t.integer :prevX
      t.integer :currX
      t.integer :prevY
      t.integer :currY
      t.integer :prevXArray, array: true, default: []
      t.integer :prevYArray, array: true, default: []
      t.integer :currXArray, array: true, default: []
      t.integer :currYArray, array: true, default: []
    end
  end
end
