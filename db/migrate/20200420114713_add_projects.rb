class AddProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
