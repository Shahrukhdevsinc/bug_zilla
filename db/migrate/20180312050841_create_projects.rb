class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :manager
      t.string :name
      t.string :description

      t.timestamps
    end
    add_foreign_key :projects, :users, column: :manager_id, primary_key: :id
  end
end
