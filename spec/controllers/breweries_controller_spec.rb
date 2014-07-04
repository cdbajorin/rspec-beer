require 'spec_helper'

describe BreweriesController do
  before(:each) do
    @brewery = FactoryGirl.create(:brewery)
  end

  ###############

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "should respond with an HTTP 200 status code" do
      expect(response.status).to eq(200)
    end

    it "should render the 'index' template" do
      expect(response).to render_template("index")
    end

    it "populates an array of breweries" do
      expect(assigns(:breweries)).to match_array([@brewery])
    end
  end

  ##################

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "should respond with an HTTP 200 status code" do
      expect(response.status).to eq(200)
    end

    it "should render the 'new' template" do
      expect(response).to render_template("new")
    end
  end

  #################

  describe "GET #show" do
    before(:each) do
      get :show, id: @brewery
    end

    it "should respond with an HTTP 200 status code" do
      expect(response.status).to eq(200)
    end

    it "should render the 'show' template" do
      expect(response).to render_template("show")
    end

    it "assigns the requested brewery to @brewery" do
      expect(assigns(:brewery)).to eq(@brewery)
    end
  end

  ##################

  describe "POST #create" do
    brewery_attrs = FactoryGirl.attributes_for(:brewery)
    before(:each) do
      post :create, brewery: brewery_attrs
    end

    context "valid params" do
      it "should redirect to #show" do
        expect(response).to redirect_to(assigns[:brewery])
      end

      it "should respond with an HTTP 302 status code" do
        expect(response.status).to eq(302)
      end
    end
  end

  ##################

  describe "GET #edit" do
    before(:each) do
      get :edit, id: @brewery.to_param
    end
    it "should respond with an HTTP 200 status code" do
      expect(response.status).to eq(200)
    end

    it "should render the 'edit' template" do
      expect(response).to render_template("edit")
    end

    it "assigns the request brewery to @brewery" do
      expect(assigns(:brewery)).to eq(@brewery)
    end

  end

end
