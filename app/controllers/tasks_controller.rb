class TasksController < ApplicationController
  before_action :prepare_task, only: %i(edit update destroy toggle)
  before_action :prepare_account, only: [:create]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = @account.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Post was successfully deleted."
  end

  def toggle
    @task.update(completed: params[:completed])

    render json: { message: "Success" }
  end

  private

  def prepare_account
    @account ||= Account.first
  end

  def prepare_task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
