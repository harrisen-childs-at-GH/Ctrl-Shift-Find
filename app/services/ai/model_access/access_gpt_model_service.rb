module Ai
    module ModelAccess
        class AccessGptModelService < ApplicationService
            option :gpt_model_request, type: Dry.Types.Instance(Ai::GptModelRequest)

            def call
                send_prompt(gpt_model_request).bind(method(:generate_response))
            end
            
            private

            def send_prompt(gpt_model_request)
                response = client.chat(
                    parameters: {
                        model: "gpt-3.5-turbo", # Required.
                        messages: [{ role: "user", content: gpt_model_request.prompt}],
                        temperature: 0.2,
                    })

                Success(response)
            end

            def generate_response(gpt_response)
                if gpt_response.include?("error")
                    update_gpt_objects(status: :error, message: gpt_response.dig("error", "message"))
                else
                    update_gpt_objects(status: :success, message: gpt_response.dig("choices", 0, "message", "content"))
                end
            end

            def update_gpt_objects(status:, message:)
                gpt_model_request.status = status
                Ai::GptModelRequest::UpdateGptModelRequestService.call(gpt_model_request: gpt_model_request)
                request_response = gpt_model_request.response
                request_response.payload = message
                Ai::GptModelResponse::UpdateGptModelResponseService.call(gpt_model_response: request_response)
            end

            def client
                @client ||= OpenAI::Client.new(access_token: ENV['OPENAI_ACCESS_TOKEN'])
            end
        end
    end
end