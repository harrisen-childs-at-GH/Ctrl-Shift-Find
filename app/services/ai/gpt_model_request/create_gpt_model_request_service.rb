module Ai
    class GptModelRequest
        class CreateGptModelRequestService < ApplicationService
            option :user_file, type: Dry.Types.Instance(UserFile)
            # option :prompt, optional: true,type: Dry::Types['string'] -- might change this later but for now one param should be fine

            def call
                create_request_prompt(user_file).bind(method(:create_request))           
            end

            private

            def create_request_prompt(user_file)
                Ai::GptModelRequest::GenerateRequestPayloadService.call(user_file: user_file)
            end

            def create_request(prompt)
                # can and should create a validator for this at some point here
                # views will also help with services in the future
                request = Ai::GptModelRequest.new(status: 0, prompt: prompt, user_file_id: user_file.id)

                RecordServices::PersistRecordService.call(record: request)
            end
        end
    end
end 