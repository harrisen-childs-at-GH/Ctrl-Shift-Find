FactoryBot.define do
    factory :gpt_model_request, class: 'Ai::GptModelRequest' do
        user_file { association(:user_file) }
        status { :pending }
        prompt { "test" }
    end
end