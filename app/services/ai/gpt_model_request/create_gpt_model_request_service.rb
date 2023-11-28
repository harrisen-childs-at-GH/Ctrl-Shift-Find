module Ai
    class GptModelRequest
        class CreateGptModelRequestService < ApplicationService
            option :user_file, type: Dry.Types.Instance(UserFile)
            option :user_given_prompt, optional: true,type: Dry::Types['string']

            def call
                create_request_prompt(user_file, user_given_prompt).bind(method(:create_request))           
            end

            private

            def create_request_prompt(user_file, user_given_prompt)
                Ai::GptModelRequest::GenerateRequestPayloadService.call(user_file: user_file, prompt: user_given_prompt)
            end

            def create_request(generated_prompt)
                request = Ai::GptModelRequest.new(status: 0, question: user_given_prompt, prompt: generated_prompt, user_file_id: user_file.id)

                RecordServices::PersistRecordService.call(record: request)
            end
        end
    end
end 