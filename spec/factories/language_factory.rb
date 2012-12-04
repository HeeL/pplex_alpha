FactoryGirl.define do
  factory :language do |language|
    sequence :name do |n|
      "prog lang #{n}"
    end
    name 'Firstname Lastname'
    password 'password'
  end
end