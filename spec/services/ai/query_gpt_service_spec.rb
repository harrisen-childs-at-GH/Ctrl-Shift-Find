require 'rails_helper'

RSpec.describe Ai::QueryGptService do
    describe '#call' do
        let(:user) { create(:user)}
        let(:repo) { create(:repo, user: user)}
        let(:user_file) { create(:user_file, repo: repo)}
        let(:gpt_model_request) { build(:gpt_model_request, user_file: user_file, prompt: "prompt") }
        let(:gpt_model_response) { build(:gpt_model_response, request: gpt_model_request)}
        let(:result) {}

        subject { Ai::QueryGptService.call(gpt_model_request: gpt_model_request) }

        before do
            allow(Ai::ModelAccess::AccessGptModelService).to receive(:call).and_return(result)
        end

        context 'when this service is called with correct parameters' do
            it 'will update the status of gpt_model_request to in_progress' do
                expect(gpt_model_request.status).to eq("pending")
                subject
                expect(gpt_model_request.status).to eq("in_progress")
            end

            it 'will call the AccessGptModelService' do
                expect(Ai::ModelAccess::AccessGptModelService).to receive(:call).with(gpt_model_request: gpt_model_request)
                subject
            end

            context 'when the AccessGptModelService is successful' do
                let(:result) { Dry::Monads.Success(gpt_model_response)}

                it 'will return a success with the gpt_model_response' do
                    expect(subject.success).to eq(gpt_model_response)
                end
            end

            context 'when the AccessGptModelService fails' do
                let(:result) { Dry::Monads.Failure(gpt_model_response)}

                it 'will return a success with the gpt_model_response' do
                    expect(subject.failure).to eq(gpt_model_response)
                end
            end
        end

        context 'when this service is called with incorrect parameters' do 
            let(:gpt_model_request) { nil }

            it 'will throw a Dry::Types error' do
                expect { subject }.to raise_error(Dry::Types::ConstraintError)
            end
        end
    end
end