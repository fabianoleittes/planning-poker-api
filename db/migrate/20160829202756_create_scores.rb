class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :value
      t.references :user, foreign_key: true
      t.references :backlog, foreign_key: true
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
