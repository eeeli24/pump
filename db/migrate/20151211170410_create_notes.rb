class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.references :resource, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
