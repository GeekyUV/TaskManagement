every 1.day, at: '12:00 am' do
    runner "Task.send_daily_alerts"
  end
  
  every 1.hour do
    runner "Task.send_hourly_alerts"
  end
  