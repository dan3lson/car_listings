Rails.logger.info "==============================================="
Rails.logger.info "Creating Manufacturers"
Rails.logger.info "==============================================="

manufacturers = %w(
  BMW
  Honda
  Fiat-Chrysler
  Tesla
  Ford
  Hyundai-Kia
  Nissan
  Volkswagen
  General Motors
  Toyota
  Lexus
  Infinity
  Mercedes
)
manufacturers.each do |manufacturer|
  m = Manufacturer.create!(
    name: manufacturer,
    country: Faker::Name.first_name,
  )
  Rails.logger.info %{
    Manufacturer:
    Name - #{m.name}
    Country - #{m.country}
  }
end

Rails.logger.info "==============================================="
Rails.logger.info "Creating Cars"
Rails.logger.info "==============================================="

colors = %w(red orange yellow green blue indigo violet)

100.times do
  car = Car.create!(
    manufacturer: Manufacturer.all.sample,
    mileage: rand(150_000),
    color: colors.sample,
    year: rand(1920..2017),
    description: Faker::Lorem.sentence
  )
  Rails.logger.info %{
    Car:
    Manufacturer - #{car.manufacturer.name}
    Color - #{car.color};
    Year - #{car.year};
    Description - #{car.description}
  }
end
