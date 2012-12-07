FactoryGirl.define do
  factory :user do |user|
    sequence :email do |n|
      "email#{n}@example.com"
    end
    name 'Firstname Lastname'
    password 'password'
  end
end