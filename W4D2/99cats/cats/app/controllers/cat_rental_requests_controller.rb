class CatRentalRequestsController  < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(rental_request_params)

    if @cat_rental_request.save
      render json: @cat_rental_request, status: :created
    else
      render json: @cat_rental_request.errors.full_messages, status: :unprocessable_entity
    end
  end


  private

  def rental_request_params
    params.require(:cat_rental_request)
      .permit(:cat_id, :start_date, :end_date, :status)
  end
end
