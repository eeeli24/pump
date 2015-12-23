class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  validates :title, presence: true

  self.per_page = 10

  scope :completed,   -> { where.not(completed_at: nil) }
  scope :incompleted, -> { where(completed_at: nil) }

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
