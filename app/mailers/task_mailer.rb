class TaskMailer < ApplicationMailer
    def deadline_alert(task, timing)
      @task = task
      @timing = timing
      mail(to: task.user.email, subject: "Task Deadline Alert: #{@task.title}")
    end
  end
  