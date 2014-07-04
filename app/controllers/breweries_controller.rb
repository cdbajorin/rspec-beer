class BreweriesController < ApplicationController

  respond_to :html

  def index
    @breweries = Brewery.all
  end

  def new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    respond_with @brewery do |format|
      if @brewery.save
        flash[:notice] = "Brewery Created"
        format.html { redirect_to @brewery }
      else
      flash[:notice] = "Invalid Entry"
      format.html { render :new }
      end
    end
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update(brewery_params)
    redirect_to @brewery
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    @brewery.destroy
    redirect_to breweries_path
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :location)
  end

end
