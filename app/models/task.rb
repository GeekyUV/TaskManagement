class Task < ApplicationRecord
  belongs_to :user
  validates :title, :state, :deadline, presence: true

  STATES = ['Backlog', 'In-progress', 'Done']

  validates :state, inclusion: { in: STATES }

end
