
# Task Management Web App

This is a web application built using Ruby on Rails(7.1.3.2),ruby(3.3.0) that helps users manage their tasks effectively.

## features

- User Authentication:- 
   Users can authenticate themselves to create tasks, ensuring security and privacy.

- Task States:- Tasks are categorized into three states - Backlog, In-progress, and Done. Users can easily track the progress of each task and update its status accordingly.

- Deadline Management: Each task includes a deadline, allowing users to set and manage timelines effectively.

- Email Alerts: : Automatic email alerts are sent to users 1 day and 1 hour before the task deadline if the task is not marked as done. This feature helps users stay on track and meet deadlines effectively.

# Getting Started

- clone the repository

```bash
git clone https://github.com/GeekyUV/TaskManagement.git

```

- initial setup to install all the required gems:-project uses devise gem for authentication,whenever gem for schdeuling jobs(email) and Rspec gem for testing check in Gemfile.


```
bundle install
```
## Set up the database:

- setup the postgres connection

in your database.yml file paste the following

```bash
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: yuvraj
  password: yuvraj123
  host: localhost

development:
  <<: *default
  database: task_manager_development

test:
  <<: *default
  database: task_manager_test

production:
  <<: *default
  database: task_manager_production
```
- remember you have your postgresql user setup replace username,password with your credentials

now our posgresql database is successfully setup, migrate the migration files and start with tha app run these commands

```bash
rails db:create
rails db:migrate
```


### Test with dummy data

- in db/seeds.rb there is some dummy data run 

```bash
rails db:seed
```
to feed the data for intial login can use username:- amaha@example.com, password: amaha7777

- Start the Rails server and begin :

```bash
rails server 
```



check test cases

- run this command
```
bundle exec rspec 
```
- all test cases are covered to check coverage run the following command in app directory

```
 open coverage/index.html
```


#### you are ready to go! 


### Guide to Rspec installation( already added in this project)
- add these in your gemfile.rb
```
gem 'rspec-rails'
gem 'simplecov', require: false
gem 'rails-controller-testing' #for assert template
```
-run bundle install to install dependencies
```
bundle install
```
- install rspec run this command to add spec folder in which we will write test cases 
```
rails generate rspec:install
```

- Create spec files for your controllers, models, and any other components you want to test. For example, you can create a spec file for your controller name yuvicontroller then spec file name would be yuvicontroller_spec.rb

- run bundle exec rspec to run test files
- to check covergae open coverage/index.html

#### Happy learning! :)




