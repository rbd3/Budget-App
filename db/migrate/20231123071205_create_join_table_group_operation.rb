class CreateJoinTableGroupOperation < ActiveRecord::Migration[7.1]
  def change
    create_join_table :Groups, :Operations do |t|
       #t.index [:group_id, :operation_id]
       #t.index [:operation_id, :group_id]
       t.belongs_to :group
      t.belongs_to :operation
    end
  end
end
