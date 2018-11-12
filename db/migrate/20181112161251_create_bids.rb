class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.decimal :price
      t.string :description
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
