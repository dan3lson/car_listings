FactoryGirl.define do
  factory :manufacturer do
    name "Tesla"
    country "USA"
  end

  factory :car do
    color "black"
    description "Thing of beauty inside and out."
    year 1933
    mileage 3

    manufacturer
  end
end
