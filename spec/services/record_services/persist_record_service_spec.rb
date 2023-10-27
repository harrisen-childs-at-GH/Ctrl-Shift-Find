require 'rails_helper'

RSpec.describe RecordServices::PersistRecordService do
    describe '#call' do
        let(:user) { build(:user)}

        subject { RecordServices::PersistRecordService.call(record: user) }

        context 'when the service is called with a record' do
            context 'when the record can be saved' do 
                it 'will return a success with the saved record' do
                    expect(subject.success).to eq(user)
                end

                it 'will persist the record' do
                    expect(subject.success).to be_persisted
                end
            end

            context 'when the record can not be saved' do 
                let(:user) { build(:user, username: nil)}

                it 'will return a failure with the record' do
                    expect(subject.failure).to eq(user)
                end
            end
        end
    end
end