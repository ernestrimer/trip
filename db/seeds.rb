require 'date'
today = DateTime.now
yesterday = Date.new(2020, 6, 6)
pre_thursday = Date.new(2020, 6, 5)
pre_wednesday = Date.new(2020, 6, 4)
pre_tuesday = Date.new(2020, 6, 3)
pre_monday = Date.new(2020, 6, 2)
pre_sunday = Date.new(2020, 6, 1)

fut_sunday = Date.new(2020, 6, 7)
fut_monday = Date.new(2020, 6, 8)
fut_tuesday = Date.new(2020, 6, 9)

pre_date_range = [pre_monday, pre_sunday, pre_tuesday, pre_wednesday, pre_thursday, yesterday, today]
fut_date_range = [fut_monday, fut_tuesday, today]


2.times do
  travel = Travel.create(
    name: Faker::Hipster.word,
    start_date: pre_date_range.sample,
    end_date: fut_date_range.sample
  ) 
  @time_until = travel.end_date - travel.start_date
  @number_of_day = @time_until.to_i + 1

  3.times do
    location = Location.create(
      name: Faker::Address.city,
      days: @number_of_day / 3,
      travel_id: travel.id
    )
    Address.create(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip_code,
      location_id: location.id
    )
  end
end
puts 'data seeded'
