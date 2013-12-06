class EventsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:show, :all_events, :index]

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
    redirect_to @event
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.title}' deleted."
    redirect_to '/'
  end

  def index
    @events = Event.near(params[:address], 50, :order => :distance)
    if params[:query]
      @search = Event.search do
        keywords params[:query]
        #fields(:description, :title)
      end
      @events = @search.results
    end
  end

  def all_events
    @events = Event.near(params[:address], 50, :order => :distance)
    @events.each do |event|
      event.starts_at = event.starts_at.to_i
      event.ends_at = event.ends_at.to_i
    end
    render json: @events
  end
end
