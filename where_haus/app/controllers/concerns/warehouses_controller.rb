class WarehousesController < ApplicationController

 def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      session[:warehouse_id] = @warehouse.id
      flash[:notice] = "Signed up!"
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def show

  end

  # def edit
  #   @warehouse = Warehouse.find(params[:id])
  # end

  # def update
  #   @warehouse = Warehouse.find(params[:id])
  # end

private

  def warehouse_params
    params.require(:warehouse).permit(:venue_name, :location, :num_exits, :square_feet, :fire_alarm)
  end
end
