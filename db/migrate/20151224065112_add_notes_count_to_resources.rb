class AddNotesCountToResources < ActiveRecord::Migration
  def change
    add_column :resources, :notes_count, :integer, default: 0
  end
end
