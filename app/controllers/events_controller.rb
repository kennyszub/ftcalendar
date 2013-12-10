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
    event_params = params[:event]
    begin
      event_params['starts_at'] = DateTime.strptime(event_params['starts_at'], "%m/%d/%Y %l:%M %p")
      event_params['ends_at'] = DateTime.strptime(event_params['ends_at'], "%m/%d/%Y %l:%M %p")
    rescue ArgumentError
      flash[:alert] = "Please enter valid dates."
      @event = Event.new(event_params)
      render 'new'
      return
    end

    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "#{@event.title} was successfully created."
      redirect_to @event
    else
      flash[:alert] = "Please correct these errors: " + @event.errors.full_messages.join(". ")
      render 'new'
    end
  end

  def update
    @event = Event.find params[:id]

    event_params = params[:event]
    begin
      event_params['starts_at'] = DateTime.strptime(event_params['starts_at'], "%m/%d/%Y %l:%M %p")
      event_params['ends_at'] = DateTime.strptime(event_params['ends_at'], "%m/%d/%Y %l:%M %p")
    rescue ArgumentError
      flash[:alert] = "Please enter valid dates."
      render 'edit'
      return
    end

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
    if admin_signed_in?
      @events = Event.find(:all, :order => :starts_at)
    else
      @events = Event.near(request.remote_ip, 30, :order => :starts_at)
    end
    if params[:query]
      @search = Event.search do
        keywords params[:query]
        #fields(:description, :title)
      end
      if admin_signed_in?
        @events = @search.results
        @events.sort! {|a,b| a.starts_at <=> b.starts_at}
      else
        @events = @search.results & @events
        @events.sort! {|a,b| a.starts_at <=> b.starts_at}
      end
    end
  end

  def all_events
    if admin_signed_in?
      @events = Event.all
    else
      @events = Event.near(request.remote_ip, 30)
    end
    @events.each do |event|
      event.starts_at = event.starts_at.to_i
      event.ends_at = event.ends_at.to_i
    end
    render json: @events
  end
end
