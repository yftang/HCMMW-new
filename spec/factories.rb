FactoryGirl.define do
  factory :user do
    name     "Eragon Tang"
    email    "tang@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
