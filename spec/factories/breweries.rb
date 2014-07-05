FactoryGirl.define do

  factory :beer do
    name "Brooklyn Lager"
    style "American Lager"
    brewery
  end

  factory :brewery do
    name "Brooklyn Brewery"
    location "Brooklyn"
    factory :brewery_with_beers do

      ignore do
        beers_count 3
      end

      after :create do |brewery, evaluator|
        create_list(:beer, evaluator.beers_count, brewery: brewery)
      end
    end
  end
end
