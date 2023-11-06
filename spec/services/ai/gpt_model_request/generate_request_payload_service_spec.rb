require 'rails_helper'

RSpec.describe Ai::GptModelRequest::GenerateRequestPayloadService do
    describe '#call' do
        let(:user) { create(:user)}
        let(:repo) { create(:repo, user: user)}
        let(:user_file) { create(:user_file, repo: repo)}

        subject { Ai::GptModelRequest::GenerateRequestPayloadService.call(user_file: user_file) }

        before do
            allow(UserFileServices::AccessUserFileService).to receive(:call).and_return(Dry::Monads.Success('test file content'))
        end

        context 'when this service is called with correct parameters' do
            it 'will call the AccessUserFileService' do
                expect(UserFileServices::AccessUserFileService).to receive(:call).with(user_file_path: 'test/file/path')
                subject
            end

            it 'will return a Success with the prompt to give the GPT model' do
                expect(subject.success).to eq("Given the following #{user_file.programming_language} code, explain in 1 sentence for each error present what the errors is, what lines they are on, and how to fix them. \ntest file content")
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