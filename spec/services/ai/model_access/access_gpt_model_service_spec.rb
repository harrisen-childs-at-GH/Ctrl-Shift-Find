require 'rails_helper'

RSpec.describe Ai::ModelAccess::AccessGptModelService do
    describe '#call' do
        let(:user) { create(:user)}
        let(:repo) { create(:repo, user: user)}
        let(:user_file) { create(:user_file, repo: repo)}
        let(:gpt_model_request) { create(:gpt_model_request, user_file: user_file, prompt: "prompt") }
        let(:gpt_model_response) { create(:gpt_model_response, request: gpt_model_request)}

        let(:model_response) {{
            "choices"=>
            [{"index"=>0,
            "message"=>
            {"role"=>"assistant",
            "content"=>
            "test"},
            "finish_reason"=>"stop"}],
        "usage"=>{"prompt_tokens"=>56, "completion_tokens"=>85, "total_tokens"=>141}}
        }

        subject { Ai::ModelAccess::AccessGptModelService.call(gpt_model_request: gpt_model_request) }

        before do
            allow(Ai::GptModelRequest::UpdateGptModelRequestService).to receive(:call).and_return(Dry::Monads.Success(gpt_model_request))
            allow(Ai::GptModelResponse::UpdateGptModelResponseService).to receive(:call).and_return(Dry::Monads.Success(gpt_model_response))

            allow_any_instance_of(OpenAI::Client).to receive(:chat).and_return(model_response)
        end

        context 'when this service is called with correct parameters' do
            it 'will send the prompt to the GPT model' do
                expect(subject.success.payload).to eq("test gpt response")
            end
        end

        context 'when this service is called with incorrect parameters' do 
            let(:gpt_model_request) { nil }
            let(:gpt_model_response) { nil }

            it 'will throw a Dry::Types error' do
                expect { subject }.to raise_error(Dry::Types::ConstraintError)
            end
        end
    end
end