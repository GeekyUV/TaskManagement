user1 = User.create!(email: 'yuvraj@gmail.com', password: 'yuvraj')
user2 = User.create!(email: 'amaha@example.com', password: 'amaha7777')

user1.tasks.create!(title: 'Design landing page', description: 'Design a visually appealing landing page for the website', state: 'Backlog', deadline: Time.now + 5.days)
user1.tasks.create!(title: 'Implement user authentication', description: 'Implement user authentication using Devise gem', state: 'In-progress', deadline: Time.now + 10.days)
user1.tasks.create!(title: 'Write blog post', description: 'Write a blog post about the latest features of the product', state: 'Done', deadline: Time.now - 2.days)

user2.tasks.create!(title: 'Fix bug in payment module', description: 'Investigate and fix a bug causing payment failures in the payment module', state: 'In-progress', deadline: Time.now + 3.days)
user2.tasks.create!(title: 'Optimize database queries', description: 'Optimize slow database queries to improve application performance', state: 'Backlog', deadline: Time.now + 7.days)
user2.tasks.create!(title: 'Prepare presentation for client meeting', description: 'Prepare a presentation to showcase project progress and future plans to the client', state: 'Backlog', deadline: Time.now + 2.days)