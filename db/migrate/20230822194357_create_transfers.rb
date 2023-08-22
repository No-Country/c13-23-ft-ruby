class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.references :movements, null: false, foreign_key: true

      t.timestamps
    end
  end
end
