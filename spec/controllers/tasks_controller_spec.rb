require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:account) { create(:account) }
  let(:task) { create(:task, account:) }
  let(:description) { 'test' }

  before do
    http_login
    task
  end

  describe "GET /index" do
    before do
      get :index
    end

    it { expect(assigns(:tasks)).to eq([task]) }
    it { expect(assigns(:task)).to be_new_record }
    it { expect(response).to render_template(:index) }
  end

  describe "POST /create" do
    before { get :create, params: { account:, task: { description: } } }

    it { expect(assigns(:task)).to be_persisted }
    it { expect(response).to redirect_to(tasks_url) }
  end

  describe "GET /edit" do
    before { get :edit, params: { id: task.id } }

    it { expect(assigns(:task)).to eq(task) }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT /update" do
    before { post :update, params: { id: task.id, task: { description: } } }

    it { expect(assigns(:task).description).to eq('test') }
    it { expect(response).to redirect_to(tasks_url) }
  end

  describe "DELETE /destroy" do
    before { delete :destroy, params: { id: task.id } }

    it { expect(assigns(:task)).to be_destroyed }
    it { expect(response).to redirect_to(tasks_path) }
  end

  describe "POST /toggle" do
    it { expect(response).to have_http_status(:success) }
  end
end
