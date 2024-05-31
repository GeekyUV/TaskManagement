class Task < ApplicationRecord
  belongs_to :user
  validates :title, :state, :deadline, presence: true

  STATES = ['Backlog', 'In-progress', 'Done']

  validates :state, inclusion: { in: STATES }

  def self.send_daily_alerts
    where('deadline >= ? AND deadline < ?', Time.now, Time.now + 1.day + 1.hour).each do |task|
      TaskMailer.deadline_alert(task, '1 Day').deliver_later
    end
  end

  def self.send_hourly_alerts
    where('deadline >= ? AND deadline < ?', Time.now, Time.now + 2.hours).each do |task|
      TaskMailer.deadline_alert(task, '1 Hour').deliver_later
    end
  end

end
