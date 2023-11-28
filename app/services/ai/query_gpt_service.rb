module Ai
    class QueryGptService < ApplicationService
        option :user_file, type: Dry.Types.Instance(UserFile)
        option :prompt, type: Dry::Types['string']

        def call
            create_gpt_model_request.bind(method(:create_gpt_model_response)).bind(method(:set_gpt_model_request_in_progress)).bind(method(:query_model))
        end

        private

        def create_gpt_model_request
            Ai::GptModelRequest::CreateGptModelRequestService.call(user_file: user_file, user_given_prompt: prompt)
        end

        def create_gpt_model_response(gpt_model_request)
            Ai::GptModelResponse::CreateGptModelResponseService.call(request_id: gpt_model_request.id)
        end

        def set_gpt_model_request_in_progress(gpt_model_response) 
            gpt_model_request = gpt_model_response.request
            gpt_model_request.status = :in_progress
            Success(gpt_model_request)
        end

        def query_model(gpt_model_request)
            Ai::ModelAccess::AccessGptModelService.call(gpt_model_request: gpt_model_request)
        end 
    end
end