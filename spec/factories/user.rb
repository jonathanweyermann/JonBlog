FactoryGirl.define do
    sequence :user_email do |n|
      "email#{n}@users.com"
    end

    factory :user do
      name "Jim Doe"
      email { generate(:user_email) }
      password "12345678"
      password_confirmation "12345678"
    end
  end
