require 'rails_helper'

RSpec.describe Ai::GptModelResponse::CreateGptModelResponseService do
    describe '#call' do
        let!(:user) { create(:user)}
        let!(:repo) { create(:repo, user: user)}
        let!(:user_file) { create(:user_file, repo: repo)}
        let!(:gpt_model_request) { create(:gpt_model_request, user_file: user_file) }
        let(:gpt_model_response) { build(:gpt_model_response, request: gpt_model_request, payload: "")}

        let(:request_id) { gpt_model_request.id}

        subject { Ai::GptModelResponse::CreateGptModelResponseService.call(payload: "", request_id: request_id) }

        before do
            allow(RecordServices::PersistRecordService).to receive(:call).and_return(Dry::Monads.Success(gpt_model_response))
        end

        context 'when this service is called with correct parameters' do
            context 'calls the PersistRecordService to save the created GptModelResponse' do
                it 'will call the PersistRecord Service' do
                    expect(RecordServices::PersistRecordService).to receive(:call)
                    subject
                end

                it 'will return a success with the created GPTModelResponse' do
                    expect(subject.success).to eq(gpt_model_response)
                end
            end
        end

        context 'when this service is called with incorrect parameters' do 
            let(:request_id) {nil}

            it 'will throw a Dry::Types error' do
                expect { subject }.to raise_error(Dry::Types::ConstraintError)
            end
        end
    end
end