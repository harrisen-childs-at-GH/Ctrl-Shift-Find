require 'rails_helper'

RSpec.describe Ai::GptModelResponse::UpdateGptModelResponseService do
    describe '#call' do
        let(:user) { create(:user)}
        let(:repo) { create(:repo, user: user)}
        let(:user_file) { create(:user_file, repo: repo)}
        let(:gpt_model_request) { build(:gpt_model_request, user_file: user_file, prompt: "prompt") }
        let(:gpt_model_response) { build(:gpt_model_response, request: gpt_model_request)}
        let(:result) {}

        subject { Ai::GptModelResponse::UpdateGptModelResponseService.call(gpt_model_response: gpt_model_response) }

        before do
            allow(RecordServices::UpdateRecordService).to receive(:call).and_return(result)
        end

        context 'when this service is called with correct parameters' do

            it 'will make a call to the UpdateRecordService' do 
                gpt_model_response.payload = "testing payload"
                expect(RecordServices::UpdateRecordService).to receive(:call).with(record: gpt_model_response)
                subject
            end

            context 'when the response is updated successfully' do 
                let(:result) { Dry::Monads.Success(gpt_model_response) }

                it 'will return a success with the GPTModelResponse' do
                    gpt_model_response.payload = "testing payload"
                    expect(subject.success).to eq(gpt_model_response)
                end
            end

            context 'when the response is not updated successfully' do 
                let(:result) { Dry::Monads.Failure(gpt_model_response) }

                it 'will return a success with the GPTModelResponse' do
                    gpt_model_response.payload = "testing payload"
                    expect(subject.failure).to eq(gpt_model_response)
                end
            end
        end

        context 'when this service is called with incorrect parameters' do 
            let(:gpt_model_response) { nil }

            it 'will throw a Dry::Types error' do
                expect { subject }.to raise_error(Dry::Types::ConstraintError)
            end
        end
    end
end