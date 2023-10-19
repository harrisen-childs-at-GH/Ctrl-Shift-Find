FactoryBot.define do
    factory :gpt_model_response, class: 'Ai::GptModelResponse' do
        request { association(:gpt_model_request) }
        payload { "test gpt response" }
    end
end