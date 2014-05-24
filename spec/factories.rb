FactoryGirl.define do
  factory :user do
    name                  "Florian Schuster"
    email                 "florian@example.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end