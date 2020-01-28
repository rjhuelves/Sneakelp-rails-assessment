class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.string :model
      t.string :colorway
      t.belongs_to :brand, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
