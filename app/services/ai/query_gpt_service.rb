module Ai
    class QueryGptService < ApplicationService
        option :gpt_model_request, type: Dry.Types.Instance(Ai::GptModelRequest)

        def call
            set_gpt_model_request_in_progress(gpt_model_request).bind(method(:query_model))
        end

        private

        def set_gpt_model_request_in_progress(gpt_model_request) 
            gpt_model_request.status = :in_progress
            Success(gpt_model_request)
        end

        def query_model(gpt_model_request)
            Ai::ModelAccess::AccessGptModelService.call(gpt_model_request: gpt_model_request)
        end 
    end
end