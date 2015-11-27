class AddCompletedAtToResources < ActiveRecord::Migration
  def change
    add_column :resources, :completed_at, :timestamp
  end
end
