module Ai
    class GptModelRequest
        class GenerateRequestPayloadService < ApplicationService
            option :user_file, type: Dry.Types.Instance(UserFile)
            option :prompt, optional: true,type: Dry::Types['string']

            def call
                get_user_file_content(user_file).bind(method(:generate_prompt))
            end

            private

            def get_user_file_content(user_file)
                UserFileServices::AccessUserFileService.call(user_file_path: user_file.path)
            end

            def generate_prompt(user_file_content)
                Success("#{prompt} \n#{user_file_content}")
            end
        end
    end
end