class AddTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.boolean :is_done, default: false
      t.integer :priority, default: 1
      t.references :project
      t.references :user
      t.datetime :due_on

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
