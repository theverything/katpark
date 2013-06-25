FactoryGirl.define do
  factory :post do
    title "Hello World"
    body "This is my first post."

    factory :featured_post do
      after_create do |post|
        post.update_attribute(:featured, true)
      end
    end
  end
end
