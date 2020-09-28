FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "User#{n}" }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:url) { |n| "http://example.com/#{n}" }
    sequence(:avatar_url) { |n| "http://example.com/avatar/#{n}" }
    # name { "MyString" }
    # url { "MyString" }
    # avatar_url { "MyString" }
    provider { "github" }
  end
end
