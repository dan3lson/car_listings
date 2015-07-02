class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order("name")
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:success] = "Manufacturer created successfully."
      redirect_to manufacturers_path
    else
      flash.now[:danger] = "Manufacturer not created successfully."
      render :new
    end
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      flash[:success] = "Manufacturer edited successfully."
      redirect_to manufacturers_path
    else
      flash.now[:danger] = "Manufacturer not edited successfully."
      render :edit
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.destroy
      flash[:success] = "Manufacturer deleted successfully."
      redirect_to manufacturers_path
    else
      flash.now[:danger] = "Manufacturer not deleted."
      redirect_to manufacturers_path
    end
  end

  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :country)
    end
end
