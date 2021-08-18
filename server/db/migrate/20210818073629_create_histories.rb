class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true, null: false
      t.string :url, null: false
      t.string :title

      t.timestamps
    end
  end
end
