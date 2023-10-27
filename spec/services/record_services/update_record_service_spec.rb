require 'rails_helper'

RSpec.describe RecordServices::UpdateRecordService do
    describe '#call' do
        let!(:user) { create(:user)}

        subject { RecordServices::UpdateRecordService.call(record: user) }

        context 'when the service is called with a record' do
            context 'when the record can be saved' do 
                it 'will return a success with the updated record' do
                    expect(user.username).to eq('test')
                    user.username = 'new name'
                    expect(subject.success).to eq(user)
                    expect(subject.success.username).to eq('new name')
                end

                it 'will persist the record' do
                    expect(user.username).to eq('test')
                    user.username = 'new name'
                    expect(subject.success).to be_persisted
                end
            end

            context 'when the record can not be saved' do 
                it 'will return a failure with the following corresponding error message' do
                    expect(user.username).to eq('test')
                    user.username = nil
                    expect(subject.failure).to eq("Unable to update User record")
                end
            end
        end
    end
end