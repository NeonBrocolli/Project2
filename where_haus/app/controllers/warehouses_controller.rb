class WarehousesController < ApplicationController

  def new
    @warehouse = Warehouse.new
  end

  def index
    @warehouses = Warehouse.all.order(:id)
  end

  def create
    @warehouse = Warehouse.create(warehouse_params)
    @warehouse.user = current_user
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

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update_attributes(warehouse_params)
      redirect_to warehouses_path
    else
      render :edit
    end
  end

  def destroy
      @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy
    respond_to do |format|
      format.html { redirect_to warehouses_path, notice: 'warehouse deleted.' }
      format.json { head :no_content }
    end
  end

private

  def warehouse_params
    params.require(:warehouse).permit(:venue_name, :location, :num_exits,
      :max_occupants, :square_feet, :fire_alarm, :description, :user_id,:image)
  end
end
