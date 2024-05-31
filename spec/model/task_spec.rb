RSpec.describe Task, type: :model do
  describe '.send_daily_alerts' do
    it 'sends daily alerts for tasks with deadline within 1 day' do
      user = User.create(email: 'test@example.com', password: 'password')
      task = Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now + 1.day - 1.hour, user: user)
      expect(TaskMailer).to receive(:deadline_alert).with(task, '1 Day').once.and_call_original
      Task.send_daily_alerts
    end
  end

  describe '.send_hourly_alerts' do
    it 'sends hourly alerts for tasks with deadline within 1 hour' do
      user = User.create(email: 'test@example.com', password: 'password')
      task = Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now + 1.hour - 1.minute, user: user)
      expect(TaskMailer).to receive(:deadline_alert).with(task, '1 Hour').once.and_call_original
      Task.send_hourly_alerts
    end
  end
end
