class TodosController < ApplicationController
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
    # find user we want to update
    # if todo we found.update(todo_params)
    #   render something
    # else
    #   render errors
    # end

    @todo = Todo.find_by(params[:id])

    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
      end
    end
  end

  def destroy
    # find the user we want to destroy
    # use active record methods - #destroy on the user we want to destrou
    # render json: user we destroyed

    @todo = Todo.find_by(params[:id])
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
