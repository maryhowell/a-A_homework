class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = selected_cat
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @cat = selected_cat
    render :edit
  end

  def update
    @cat = selected_cat

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :name, :sex, :description)
  end

  def selected_cat
    Cat.find(params[:id])
  end
end
