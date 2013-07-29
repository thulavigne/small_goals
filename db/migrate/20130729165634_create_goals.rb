class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :name

      t.timestamps :time
    end
  end
end
