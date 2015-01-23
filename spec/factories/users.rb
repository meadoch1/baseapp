FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    password '1234abcD'
  end

  factory :admin, class: User do
    email 'admin@bar.com'
    password '1234abcD'
    admin true
  end

end
