class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :description
      t.string :condition
      t.string :start
      t.string :end
      t.timestamps
    end
  end
end
