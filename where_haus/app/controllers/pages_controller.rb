class PagesController < ApplicationController
  def home
    @warehouses = Warehouse.all
    @events = Event.all
  end
end
