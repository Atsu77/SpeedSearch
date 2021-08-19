class CreateHistoryTag < ActiveRecord::Migration[5.2]
  def change
    create_table :history_tags do |t|
      t.references :history, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
