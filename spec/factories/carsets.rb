FactoryGirl.define do
  factory :carset do
    name "Set 1"
    description "Test set 1"
    user nil
    file { fixture_file_upload(Rails.root.join( 'spec', 'fixtures','data', 'carset.csv'), 'text/csv')  }
  end

end
