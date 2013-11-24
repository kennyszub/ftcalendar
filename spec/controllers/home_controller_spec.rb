require 'spec_helper' 

describe HomeController do

  describe 'show all events' do
    login_admin

    it 'should show all event at the home page' do
      Event.should_receive(:all)
      get :index
      response.should render_template(:index)
    end
  end
end
