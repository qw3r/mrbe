class CreateTricks < ActiveRecord::Migration[5.0]
  def change
    create_table :tricks do |t|
      t.references :dog, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
