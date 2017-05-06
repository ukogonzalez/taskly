class Api::V1::TasksController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found"}, status: 404
      return
    end
    tasks_completed = user.tasks.where(completed: true)
    tasks_pending = user.tasks.where(completed: false)
    render json: { completed: tasks_completed, pending: tasks_pending }
  end

  def create
    user = User.find_by(id: params[:id])
    unless user
      render json: { error: "user not found" }, status: 404
      return
    end
    task = user.tasks.create(task_params)
    render json: task
  end

  def show
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found"}, status: 404
      return
    end
    task = user.tasks.find_by(id: params[:id])
    unless task
      render json: { error: "task not found"}, status: 404
      return
    end
    render json: task
  end

  def destroy
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found"}, status: 404
      return
    end
    task = user.tasks.find_by(id: params[:id])
    unless task
      render json: { error: "task not found"}, status: 404
      return
    end
    task.destroy
    render json: task
  end

  def complete
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found"}, status: 404
      return
    end
    task = user.tasks.find_by(id: params[:id])
    unless task
      render json: { error: "task not found"}, status: 404
      return
    end
    task.complete
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date)
  end

end
