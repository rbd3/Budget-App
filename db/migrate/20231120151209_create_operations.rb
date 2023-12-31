class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :group, foreign_key: { to_table: :groups }
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
