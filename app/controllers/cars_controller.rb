class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:success] = "Car created successfully."
      redirect_to cars_path
    else
      flash.now[:danger] = "Car not created successfully."
      render :new
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:success] = "Car edited successfully."
      redirect_to cars_path
    else
      flash.now[:danger] = "Car not edited successfully."
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      flash[:success] = "Car deleted successfully."
      redirect_to cars_path
    else
      flash.now[:danger] = "Car not deleted."
      redirect_to cars_path
    end
  end

  private
    def car_params
      params.require(:car).permit(
        :mileage,
        :year,
        :color,
        :description,
        :manufacturer_id
      )
    end
end
