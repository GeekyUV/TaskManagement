# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      user = User.create(email: 'test@example.com', password: 'password') # Create a user directly
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      user = User.create(email: 'test@example.com', password: 'password')
      task = Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now, user: user)
      sign_in user
      get :show, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      user = User.create(email: 'test@example.com', password: 'password')
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      user = User.create(email: 'test@example.com', password: 'password')
      task = Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now, user: user)
      sign_in user
      get :edit, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new task' do
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user
        expect {
          post :create, params: { task: { title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now } }
        }.to change(Task, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a new task' do
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in user
        expect {
          post :create, params: { task: { title: nil, description: 'Test description', state: 'Backlog', deadline: Time.now } }
        }.to_not change(Task, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { User.create(email: 'test@example.com', password: 'password') }
    let(:task) { Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now, user: user) }

    context 'with valid params' do
      it 'updates the task' do
        sign_in user
        patch :update, params: { id: task.id, task: { title: 'New Title' } }
        task.reload
        expect(task.title).to eq('New Title')
      end
    end

    context 'with invalid params' do
      it 'does not update the task' do
        sign_in user
        patch :update, params: { id: task.id, task: { title: nil } }
        task.reload
        expect(task.title).to_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the task' do
      user = User.create(email: 'test@example.com', password: 'password')
      task = Task.create(title: 'Test Task', description: 'Test description', state: 'Backlog', deadline: Time.now, user: user)
      sign_in user
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end
  end
end
