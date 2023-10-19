module Ai
    class GptModelRequest
        class GenerateRequestPayloadService < ApplicationService
            # option :question_type, optional: true, type: Dry.Types['string'] # do not need this now but could useful to switch between different prompts quickly
            option :user_file, type: Dry.Types.Instance(UserFile)

            def call
                get_user_file_content(user_file).bind(method(:generate_prompt))
            end

            private

            def get_user_file_content(user_file)
                UserFileServices::AccessUserFileService.call(user_file_path: user_file.path)
            end

            def generate_prompt(user_file_content)
                Success("Given the following #{user_file.programming_language} code, explain in 1 sentence for each error present what the errors is, what lines they are on, and how to fix them. \n#{user_file_content}")
            end
        end
    end
end