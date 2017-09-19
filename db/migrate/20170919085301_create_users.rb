class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :telegram_id
      t.integer :resetted
      t.string :name
      t.column :state, :jsonb

      t.timestamps
    end
  end
end
