class Api::TodosController < ApplicationController
  def show
    render json: Todo.find_by(params[:id])
  end

  def index
    todos = Todo.all
    render json: todos
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end
  
  def update
   

    @todo = Todo.find_by(params[:id])

    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
      end
  end

  def destroy
  

    @todo = Todo.find_by(params[:id])
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
