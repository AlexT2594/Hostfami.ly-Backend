require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.utype "student"
    f.firstname { Faker::Name.first_name }
    f.lastname { Faker::Name.last_name }
    f.email "a@a.it"
    f.email_confirmation "a@a.it"
    f.birthday { Faker::Date.birthday(10,100) }
    f.state { Faker::Address.state }
    f.city { Faker::Address.city }
    f.address { Faker::Address.street_address }
    f.password "Miao123"
    f.password_confirmation "Miao123"
    f.email_confirmed true
    f.confirm_token { Faker::Crypto.md5 }
  end

  factory :invalid_user, parent: :user do |f|
  	f.firstname nil
  end
end
