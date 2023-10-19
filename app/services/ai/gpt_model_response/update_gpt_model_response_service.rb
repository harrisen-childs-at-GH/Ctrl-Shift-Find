module Ai
    class GptModelResponse
        class UpdateGptModelResponseService < ApplicationService
            option :gpt_model_response, type: Dry.Types.Instance(Ai::GptModelResponse)
                
            def call
                update_request(gpt_model_response)                
            end

            private

            def update_request(gpt_model_response)
                # can and should create a validator for this at some point here
                # views will also help with services in the future
                
                RecordServices::UpdateRecordService.call(record: gpt_model_response)
            end
        end
    end
end 