class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.string :description
      t.string :type
      t.date :deadline
      t.string :screenshot
      t.references:createdby 
      t.references:assignedto
      t.timestamps
    end
     add_foreign_key :bugs, :users, column: :createdby_id, primary_key: :id
    add_foreign_key :bugs, :users, column: :assignedto_id, primary_key: :id
  end
end
