require 'spec_helper'

describe EventsController do
  
  describe 'add a new event' do
    login_admin

    it 'should be able to add a new event on the calendar' do
      get :new
      response.should render_template('new')
    end
  end  

  describe 'edit an event' do 
    login_admin   
    
    it 'should show the form to edit an event' do
      event = double('Event', :title => 'test')
      Event.should_receive(:find).with('5').and_return(event)
      get :edit, {:id => '5'}
      response.should render_template('edit')
    end
  end

  describe 'show an event' do
    login_admin

    it 'should display the event and its appropriate info' do
      event = double('Event')
      Event.should_receive(:find).with('5').and_return(event)
      get :show, {:id => '5'}
      response.should render_template('show')
    end
  end

  describe 'create an event' do
    login_admin

    it 'should create an event successfully' do
      event = double('Event', :title => 'test')
      Event.should_receive(:create!).and_return(event)
      post :create, :event => event
      response.should redirect_to('/')
    end
  end

  describe 'update an event' do
    login_admin
 
    it 'should save the updated event information' do
      event = double('Event', :id => '5', :title => 'test')
      Event.should_receive(:find).with('5').and_return(event)
      event.should_receive(:update_attributes!)
      put :update, :id => '5', :event => event
      response.should redirect_to('/')
    end
  end

  describe 'delete an event' do
    login_admin
    
    it 'should delete the event successfully' do
      event = double('Event', :id => '5', :title => 'test')
      Event.should_receive(:find).with('5').and_return(event)
      event.should_receive(:destroy)
      delete :destroy, :id => '5'
      response.should redirect_to('/')
    end
  end

  describe 'all events' do
    login_admin

    it 'should find and list all events' do
      fake_results = [double('Event'), double('Event')]
      Event.should_receive(:all).and_return(fake_results)
      fake_results.should_receive(:each)
      get :all_events
      response.header['Content-Type'].should match /json/
    end
  end
end