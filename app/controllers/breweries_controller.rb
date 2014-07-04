class BreweriesController < ApplicationController

  respond_to :html

  def index
    @breweries = Brewery.all
  end

  def new
  end

  def create
    @brewery = Brewery.new({
      name: params[:brewery][:name],
      location: params[:brewery][:location]
    })

    respond_with @brewery do |format|
      if @brewery.save
        flash[:notice] = "Brewery Created"
        format.html { redirect_to @brewery }
      # else
      #   format.html { render :new }
      end
    end
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update({
      name: params[:brewery][:name],
      location: params[:brewery][:location]
    })
    redirect_to @brewery
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    @brewery.destroy
    redirect_to breweries_path
  end

end
