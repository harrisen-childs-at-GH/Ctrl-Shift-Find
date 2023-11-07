class System
    def testServices
        generate_dummy_data if Repo.all.empty? 

        current_user = User.first # just a test user
        user_test_file = current_user.repos.first.user_files.last # the user file we want to ask questions about
        gpt_model_request = Ai::GptModelRequest::CreateGptModelRequestService.call(user_file: user_test_file).success
        gpt_model_response = Ai::GptModelResponse::CreateGptModelResponseService.call(request_id: gpt_model_request.id).success
        Ai::QueryGptService.call(gpt_model_request: gpt_model_request).success
    end
    
    # using this in case I make database changes for early stage testing
    def generate_dummy_data
        User.new(username: "hgc71130").save
        Repo.new(name: 'Exploring ChatGPT with Rails', version_control_url: 'https://github.com/Harris-Childs/Crtl-Shift-Find', user_id: 1).save
        UserFile.new(name: 'Example-Ruby-File', path: 'spec/examples/user_file_examples/test-ruby-file.rb', programming_language: "ruby", repo_id: 1).save
        UserFile.new(name: 'Example-Java-File', path: 'spec/examples/user_file_examples/test-java.java', programming_language: "java", repo_id: 1).save
    end
end
