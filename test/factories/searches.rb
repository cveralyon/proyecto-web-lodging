FactoryBot.define do
  factory :search do
    check_in { "2021-06-01" }
    check_out { "2021-06-01" }
    daily_fee_min { "9.99" }
    daily_fee_max { "9.99" }
    location { "MyString" }
    pets_accepted { false }
    parking_lot { false }
    breakfast_included { false }
    single_bed { 1 }
    double_bed { 1 }
    rooms { 1 }
    bathrooms { 1 }
    jacuzzi { false }
    gym { false }
    smoke_free { false }
  end
end
