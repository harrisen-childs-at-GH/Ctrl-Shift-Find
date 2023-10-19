FactoryBot.define do
    factory :repo do
        user { association(:user) }
        name { 'rspec-repo-name' }
        version_control_url { 'google.com' }
    end
end