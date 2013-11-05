class EventsController < ApplicationController

  before_filter :authenticate_admin!, :except => :show

  def new
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def create
    @event = Event.create!(params[:event])
    flash[:notice] = "#{@event.title} was successfully created."
    redirect_to '/'
  end
end
