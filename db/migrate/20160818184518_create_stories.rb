class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :description, null: false, default: ""
      t.belongs_to :backlog, foreign_key: true

      t.timestamps
    end
  end
end
