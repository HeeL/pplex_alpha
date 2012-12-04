FactoryGirl.define do
  factory :language do |language|
    sequence :name do |n|
      "prog lang #{n}"
    end
  end
end