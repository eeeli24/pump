class Note < ActiveRecord::Base
  belongs_to :resource, counter_cache: :notes_count
  validates :text, presence: true
end
