FactoryGirl.define do
  factory :user do |user|
    sequence :email do |n|
      "email#{n}@12gebrauchtwagen.at"
    end
    name 'Firstname Lastname'
    password 'password'
  end
end