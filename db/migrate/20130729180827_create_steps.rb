class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :name
      t.references :goal

      t.timestamps
    end
    add_index :steps, :goal_id
  end
end
