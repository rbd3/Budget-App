class CreateJoinTableGroupsOperations < ActiveRecord::Migration[7.1]
  def change
    create_join_table :Groups, :Operations do |t|
      t.index [:group_id, :operation_id]
       t.index [:operation_id, :group_id]
       t.references :group, foreign_key: { to_table: :groups }
       t.references :operation, foreign_key: { to_table: :operations }
    end
  end
end
