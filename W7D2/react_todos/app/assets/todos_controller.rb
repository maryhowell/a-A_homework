class TodosController < ApplicationController

  def index
    render json: Todo.all.where(user_id: current_user.id)
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    render json: @todo
  end

  def show
    render json: Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

  #   before_action :require_user!, only: [:new, :create, :edit, :update]
  #
  # def index
  #   @cats = Cat.all
  #   render :index
  # end
  #
  # def show
  #   @cat = Cat.find(params[:id])
  #   render :show
  # end
  #
  # def new
  #   @cat = Cat.new
  #   render :new
  # end
  #
  # def create
  #   @cat = current_user.cats.new(cat_params)
  #   if @cat.save
  #     redirect_to cat_url(@cat)
  #   else
  #     flash.now[:errors] = @cat.errors.full_messages
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @cat = current_user.cats.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @cat = current_user.cats.find(params[:id])
  #   if @cat.update_attributes(cat_params)
  #     redirect_to cat_url(@cat)
  #   else
  #     flash.now[:errors] = @cat.errors.full_messages
  #     render :edit
  #   end
  # end
  #
  # private
  #
  # def cat_params
  #   params.require(:cat)
  #     .permit(:age, :birth_date, :color, :description, :name, :sex)
  # end

end
