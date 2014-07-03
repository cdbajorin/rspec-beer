require 'spec_helper'

describe BreweriesController do
  describe "GET #index" do
    it "should respond with an HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all breweries into @breweries" do
      brewery1, brewery2 = Brewery.create!, Brewery.create!
      get :index
      expect(assigns(:breweries)).to match_array([brewery1, brewery2])
    end
  end

end
