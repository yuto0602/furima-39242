FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    user_last_name        { person.last.kanji }
    user_first_name       { person.first.kanji }
    user_last_name_add    { person.last.katakana }
    user_first_name_add   { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
