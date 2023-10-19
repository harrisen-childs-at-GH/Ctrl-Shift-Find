module Ai
    class GptModelResponse
        class CreateGptModelResponseService < ApplicationService
            option :payload, optional: true, type: Dry::Types['string']
            option :request_id, type: Dry::Types['integer']

            def call
                create_response(payload, request_id)                
            end

            private

            def create_response(payload, request_id)
                # can and should create a validator for this at some point here
                # views will also help with services in the future
                response = Ai::GptModelResponse.new(payload: payload, request_id: request_id)

                RecordServices::PersistRecordService.call(record: response)
            end
        end
    end
end 