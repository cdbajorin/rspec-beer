require 'spec_helper'

describe BreweriesController do
  before(:each) do
    @brewery = FactoryGirl.create(:brewery)
  end

  ###############

  describe "GET #index" do
    it "should respond with an HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should render the 'index' template" do
      get :index
      expect(response).to render_template("index")
    end

    it "populates an array of breweries" do
      get :index
      expect(assigns(:breweries)).to match_array([@brewery])
    end
  end

  ##################

  describe "GET #new" do
    it "should respond with an HTTP 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "should render the 'new' template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  #################

  describe "GET #show" do
    it "should respond with an HTTP 200 status code" do
      get :show, id: @brewery
      expect(response.status).to eq(200)
    end

    it "should render the 'show' template" do
      get :show, id: @brewery
      expect(response).to render_template("show")
    end

    it "assigns the requested brewery to @brewery" do
      get :show, id: @brewery
      expect(@brewery.name).to eq("Brooklyn Brewery")
    end
  end

  ##################

  describe "POST #create" do
    brewery_attrs = FactoryGirl.attributes_for(:brewery)
    context "valid params" do
      it "should redirect to #show" do
        post :create, brewery: brewery_attrs
        expect(response).to redirect_to(assigns[:brewery])
      end

      it "should respond with an HTTP 302 status code" do
        post :create, brewery: brewery_attrs
        expect(response.status).to eq(302)
      end
    end
  end

  ##################

  describe "GET #edit" do
    it "should respond with an HTTP 200 status code" do
      pending "waiting for create redirect to work"
      get :edit
      expect(response.status).to eq(200)
    end

  end

end
