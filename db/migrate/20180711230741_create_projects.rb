class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :github
      t.string :projecturl
      t.references :admin, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
