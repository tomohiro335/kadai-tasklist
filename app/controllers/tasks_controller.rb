class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @tasks = Task.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def show
#    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に登録されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスクが登録されませんでした'
      render 'toppages/index'
    end
  end
  
  def edit
#    @task = Task.find(params[:id])
  end
  
  def update
#    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクの正常更新完了'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクの更新失敗'
      render :edit
    end
  end
  
  def destroy
#    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'タスクは正常に削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_tasks
    @task = Task.find(params[:id])
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_path
    end
  end
end
