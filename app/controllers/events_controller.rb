class EventsController < ApplicationController

  before_filter :authenticate_admin!, :except => :show

  def new
    @event = Event.new
  end

  def edit
    id = params[:id]
    @event = Event.find(id)
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

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to '/'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.title}' deleted."
    redirect_to '/'
  end
end
