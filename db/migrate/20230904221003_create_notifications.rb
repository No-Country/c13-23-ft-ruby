class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :business, null: false, foreign_key: true
      t.string :name
      t.date :date
      t.integer :status, default: 0
      t.decimal :balance, default: 0
      t.string :currency
      t.text :note

      t.timestamps
    end
  end
end
