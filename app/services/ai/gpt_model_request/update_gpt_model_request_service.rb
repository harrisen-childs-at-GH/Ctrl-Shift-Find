module Ai
    class GptModelRequest
        class UpdateGptModelRequestService < ApplicationService
            option :gpt_model_request, type: Dry.Types.Instance(Ai::GptModelRequest)

            def call
                update_request(gpt_model_request)                
            end

            private

            def update_request(gpt_model_request)
                # can and should create a validator for this at some point here
                # views will also help with services in the future
                RecordServices::UpdateRecordService.call(record: gpt_model_request)
            end
        end
    end
end 