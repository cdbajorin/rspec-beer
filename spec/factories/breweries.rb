FactoryGirl.define do

  factory :brewery do
    name "Brooklyn Brewery"
    location "Brooklyn"

    factory :brewery_with_beers do
      transient do
        beer_count 3
      end

      after :create do |brewery, evaluator|
        create_list :beer, evaluator.beer_count, brewery: brewery
      end
    end
  end
end
