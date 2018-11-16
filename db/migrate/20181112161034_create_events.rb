class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :event_type
      t.string :location
      t.string :description
      t.integer :party_size
      t.string :service
      t.integer :max_price
      t.integer :min_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
