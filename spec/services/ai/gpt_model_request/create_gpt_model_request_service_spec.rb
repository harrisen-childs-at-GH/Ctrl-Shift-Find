require 'rails_helper'

RSpec.describe Ai::GptModelRequest::CreateGptModelRequestService do
    describe '#call' do
        let(:user) { create(:user)}
        let(:repo) { create(:repo, user: user)}
        let(:user_file) { create(:user_file, repo: repo)}
        let(:gpt_model_request) { build(:gpt_model_request, user_file: user_file, prompt: "prompt") }
        let(:gpt_model_response) { build(:gpt_model_response, request: gpt_model_request)}

        subject { Ai::GptModelRequest::CreateGptModelRequestService.call(user_file: user_file) }

        before do
            allow(Ai::GptModelRequest::GenerateRequestPayloadService).to receive(:call).and_return(Dry::Monads.Success("prompt"))
            allow(RecordServices::PersistRecordService).to receive(:call).and_return(Dry::Monads.Success(gpt_model_request))
        end

        context 'when this service is called with correct parameters' do
            it 'will make a call to the GenerateRequestPayloadService' do 
                expect(Ai::GptModelRequest::GenerateRequestPayloadService).to receive(:call).with(user_file: user_file)
                subject
            end

            context 'calls the PersistRecordService to save the created GptModelRequest' do
                it 'will call the PersistRecord Service' do
                    expect(RecordServices::PersistRecordService).to receive(:call)
                    subject
                end

                it 'will return a success with the created GPTModelRequest' do
                    expect(subject.success).to eq(gpt_model_request)
                end
            end
        end

        context 'when this service is called with incorrect parameters' do 
            let(:user_file) { nil }

            it 'will throw a Dry::Types error' do
                expect { subject }.to raise_error(Dry::Types::ConstraintError)
            end
        end
    end
end