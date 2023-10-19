FactoryBot.define do
    factory :user_file do
        repo { Repo.first } # need to change this to also include the association
        gpt_model_requests { [] }
        name { 'rspec-file-name' }
        path { 'test/file/path' }
        programming_language { :ruby }
    end
end