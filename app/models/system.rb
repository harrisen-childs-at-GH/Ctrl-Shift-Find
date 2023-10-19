class System
    def testServices
        current_user = User.first # just a test user
        user_test_file = current_user.repos.first.user_files.first # the user file we want to ask questions about
        gpt_model_request = Ai::GptModelRequest::CreateGptModelRequestService.call(user_file: user_test_file).success
        gpt_model_response = Ai::GptModelResponse::CreateGptModelResponseService.call(request_id: gpt_model_request.id).success
        Ai::QueryGptService.call(gpt_model_request: gpt_model_request).success
    end
end
