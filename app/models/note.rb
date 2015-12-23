class Note < ActiveRecord::Base
  belongs_to :resource
  validates :text, presence: true
end
