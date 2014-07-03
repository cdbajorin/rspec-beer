class BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def new
  end

  def create
    Brewery.create(params)
    redirect_to brewery_path(params[:id])
  end

  def show
  end

end
