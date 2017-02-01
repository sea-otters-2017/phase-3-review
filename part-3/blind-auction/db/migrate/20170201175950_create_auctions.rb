class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name,       null: false
      t.string :description, null: false
      t.string :condition, null: false
      t.string :start, null: false
      t.string :end, null: false
      t.timestamps
    end
  end
end
