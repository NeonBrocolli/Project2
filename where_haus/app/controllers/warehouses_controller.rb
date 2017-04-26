class WarehousesController < ApplicationController
  # before_action :set_warehouses, only: [:new, :create, :show, :edit, :]
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = "Added"
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  # def edit
  #   @warehouse = Warehouse.find(params[:id])
  # end

  # def update
  #   @warehouse = Warehouse.find(params[:id])
  # end

  # def destroy
  #   @warehouse = Warehouse.find(params[:id])
  # end

private

  # def set_warehouses
  #   @warehouse = Warehouse.find(params[:id])
  # end

  def warehouse_params
    params.require(:warehouse).permit(:venue_name, :location, :num_exits, :square_feet, :fire_alarm)
  end
end
