Brewery.delete_all
Beer.delete_all

brewery = Brewery.create({ name: "Brooklyn Brewery", location: "Brooklyn, NY"})
beers = [
          { name: 'Brooklyn Lager', style: 'American Amber Lager', brewery_id: brewery.id},
          {name: 'Brooklyn Brown Ale', style: 'American Brown Ale', brewery_id: brewery.id},
          {name: 'Brooklyn East India Pale Ale', style: 'IPA', brewery_id: brewery.id},
          {name: 'Brooklyn Pilsner', style: 'Full-malt Pilsner', brewery_id: brewery.id}
        ]
beers.each do |beer|
  Beer.create(beer)
end

brewery = Brewery.create({ name: "Six Point Brewery", location: "Brooklyn, NY"})
beers = [
          { name: 'Sweet Action', style: 'Cream Ale', brewery_id: brewery.id},
          {name: 'Righteous Ale', style: 'Rye Beer', brewery_id: brewery.id},
          {name: 'Bengali', style: 'IPA', brewery_id: brewery.id},
          {name: 'The Crisp', style: 'German Pilsner', brewery_id: brewery.id}
        ]
beers.each do |beer|
  Beer.create(beer)
end
