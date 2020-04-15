class TasksController < ApplicationController
  def index
    @tasks = Task.page(params[:page]).per(5).order(created_at: :desc)

    if params[:task_name].present?
      @tasks = @tasks.get_by_task_name params[:task_name]
    end

    if params[:status].present?
      @tasks = @tasks.get_by_status params[:status]
    end

    if params[:sort_expired]
      @tasks = Task.page(params[:page]).per(5).order(deadline: :desc)
    end

    if params[:sort_priority]
      @tasks = Task.page(params[:page]).per(5).order(priority: :asc)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク 「#{@task.task_name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice:"タスク「#{task.task_name}」を削除しました。"
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.task_name}」を更新しました。"
  end


  private

  def task_params
    params.require(:task).permit(:task_name, :deadline, :priority, :status, :user_name)
  end

end
