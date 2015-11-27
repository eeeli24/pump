class Resource < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates :title, presence: true

  self.per_page = 10

  def mark_complete
    touch :completed_at
  end

  def completed?
    completed_at
  end

  def mark_incomplete
    update(completed_at: nil)
  end
end
