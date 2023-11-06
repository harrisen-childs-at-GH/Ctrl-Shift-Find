require 'rails_helper'

RSpec.describe UserFileServices::AccessUserFileService do
    describe '#call' do
        let!(:user) { create(:user)}
        let!(:repo) { create(:repo, user: user)}
        let!(:user_file) { create(:user_file, repo: repo)}
        let(:user_file_path) { user_file.path }
        let(:result) {true}

        subject { UserFileServices::AccessUserFileService.call(user_file_path: user_file_path) }

        before do 
            allow(File).to receive(:exists?).and_return(result)
            allow(File).to receive(:read).and_return("Test file content")
        end

        context 'when the service is called with the correct options' do
            context 'when the file exists' do 
                it 'will return a success with the file content' do
                    expect(subject.success).to eq("Test file content")
                end
            end

            context 'when the file does not exist' do
                let(:result) { false }

                it 'will return a failure with the correct error message' do 
                    expect(subject.failure).to eq("User File at path #{user_file_path} does not exist.")
                end
            end
        end

        context 'when the service is called with incorrect options' do
            let(:user_file_path) { nil }
            context 'when given a invalid user file' do
                it 'will throw a Dry::Types error' do
                    expect { subject }.to raise_error(Dry::Types::ConstraintError)
                end
            end
        end
    end
end