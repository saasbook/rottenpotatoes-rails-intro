require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "should render status 200" do
      get :index
      expect(response).to be_success
    end
  end

end
