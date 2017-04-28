class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

def index
  @events = Event.all.order(:id)
end

def new
  @warehouse = Warehouse.find(params[:warehouse_id])
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  @event.warehouse_id = params[:warehouse_id]
  @event.user = current_user
  if @event.save
    flash[:notice] = "Added Event"
    redirect_to warehouse_events_path
  else
    @warehouse = Warehouse.find(params[:warehouse_id])
    render :new
  end
end

def show
  @event = Event.find(params[:id])
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
    redirect_to warehouse_events_path
  else
    render :edit
  end
end

def destroy
  @event = Event.find(params[:id])
  warehouse_id = @event.warehouse.id
  @event.destroy
  redirect_to warehouse_path(warehouse_id)
end

private
  def event_params
    params.require(:event).permit(
      :event_name, :date, :price, :user_id, :image)
  end

  def authorize
    redirect_to login_path, alert: 'Uncool Man!' if current_user.nil?
  end
end
