Rails.application.routes.draw do

  resources :breweries do
    resources :beers, except: [:index, :show]
  end

end
