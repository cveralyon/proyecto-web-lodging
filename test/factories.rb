require 'securerandom'

include ActionView::Helpers::NumberHelper
include ActionView::Helpers::DateHelper
include FactoryBot::Syntax::Methods
FactoryBot.define do

  factory :user do
    first_name { Faker::Artist.name }
    last_name { Faker::Name.last_name }
    rut { Faker::ChileRut.full_rut }.to_s
    email { "#{first_name.gsub(/\s+/, "")}.#{last_name.gsub(/\s+/, "")}@example.com".downcase }
    password { Faker::Internet.password(min_length: 8) }
    admin { false }

    factory :user_with_lodgings_with_reservations_with_reviews do
      transient do
        lodging_count { rand(0..3) }
      end

      after(:create) do |user, evaluator|
        create_list(:lodging_with_reservations_with_reviews,
                    evaluator.lodging_count, user: user)
        user.reload
      end
    end
  end

  factory :lodging do
    name { Faker::Company.name }
    description { Faker::Restaurant.description }
    daily_fee { number_with_precision(Faker::Number.between(from: 15.0, to: 500.0), precision: 2) }
    location { Faker::Address.city }
    availability_from { Faker::Date.between(from: (Date.today - 5), to: Date.today) }
    availability_to { Faker::Date.between_except(from: (Date.today + 7), to: '2022-12-25', excepted: Date.today) }
    pets_accepted { Faker::Boolean.boolean }
    parking_lot { Faker::Boolean.boolean }
    breakfast_included { Faker::Boolean.boolean }
    single_bed { Faker::Number.between(from: 1, to: 5) }
    double_bed { Faker::Number.between(from: 1, to: 5) }
    rooms { Faker::Number.between(from: 1, to: 5) }
    bathrooms { Faker::Number.between(from: 1, to: 3) }
    jacuzzi { Faker::Boolean.boolean }
    gym { Faker::Boolean.boolean }
    smoke_free { Faker::Boolean.boolean }


    factory :lodging_with_reservations_with_reviews do
      transient do
        reservation_count { rand(0..2) }
      end
      after(:create) do |lodging, evaluator|
        create_list(:reservation_with_reviews, evaluator.reservation_count, lodging: lodging)
      end
    end
  end

  factory :report do
    subject { Faker::ChuckNorris.fact }
    text { Faker::Restaurant.review }

    before(:create) do |report|
      aux = User.order(Arel.sql('RANDOM()')).limit(2)
      report.reportSender = aux[0]
      report.reportReceiver = aux[1]
    end
  end
  factory :review_lodging do
    lodging { Lodging.find_in_batches.to_a.sample.sample }
    text { Faker::ChuckNorris.fact }
    rating { 1.step(by: 0.5, to: 5).to_a.sample }
    user { User.find_in_batches.to_a.sample.sample }
  end

  factory :review_user do
    received { User.find_in_batches.to_a.sample.sample }
    text { Faker::ChuckNorris.fact }
    rating { 1.step(by: 0.5, to: 5).to_a.sample }
    made { User.find_in_batches.to_a.sample.sample }
  end

  factory :reservation do
    transfer_receipt { false }
    lodging { Lodging.find_in_batches.to_a.sample.sample }
    user { User.find_in_batches.to_a.sample.sample }


    before(:create) do |reservation|
      lodg = Lodging.order(Arel.sql('RANDOM()')).limit(1)
      reservation.entry_date { Date.parse(lodg[:availability_from] + 1) }
      num = Faker::Number.between(from: 1, to: 5)
      reservation.departure_date { Date.parse(lodg[:availability_from] + num) }
      reservation.price { lodg[:daily_fee] * num }
      reservation.reserve_expiration = Date.today + 2
    end

    factory :reservation_with_reviews do
      transient do
        review_count { rand(0..2) }
      end
      after(:create) do |reservation, evaluator|
        create_list(:review_lodging, evaluator.review_count, lodging: reservation.lodging)
      end
    end
  end



end
