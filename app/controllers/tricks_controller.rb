class TricksController < ApplicationController
  before_action :set_dog, only: [:index, :create]
  before_action :set_trick, only: [:show, :update, :destroy]

  # GET /dogs/:dog_id/tricks
  def index
    @tricks = @dog.tricks

    render json: @tricks
  end



  # GET /tricks/1
  def show
    render json: @trick
  end



  # POST /dogs/:dog_id/tricks
  def create
    @trick = @dog.tricks.new(trick_params)

    if @trick.save
      render json: @trick, status: :created, location: @trick
    else
      render json: @trick.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /tricks/1
  def update
    if @trick.update(trick_params)
      render json: @trick
    else
      render json: @trick.errors, status: :unprocessable_entity
    end
  end



  # DELETE /tricks/1
  def destroy
    @trick.destroy
  end



  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end



  def set_trick
    @trick = Trick.find(params[:id])
  end



  def trick_params
    params.require(:trick).permit(:name, :description)
  end
end
