include ActionDispatch::TestProcess
FactoryGirl.define do
  sequence :name do |n|
    "The #{n}'th page"
  end
  sequence :slug do |n|
    "The_#{n}th_page"
  end
  sequence :image do |n|
    "sample_page_#{n}"
  end

  factory :portfolio, class: Portfolio do
    image { fixture_file_upload("#{Rails.root}/app/assets/images/agile.jpg", "image/jpg") }
    image_file_size '123123'
    image_content_type 'image/jpeg'
    name
    description 'random text blurb'
    link 'https://www.example.com'
    priority 3
    publish 1
    slug
  end
end
