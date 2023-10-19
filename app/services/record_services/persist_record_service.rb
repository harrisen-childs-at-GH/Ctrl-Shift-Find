module RecordServices
    class PersistRecordService < ApplicationService
        option :record, optional: false

        def call
            persist_record(record)
        end

        private

        def persist_record(record)
            return Success(record) if record.save
            Failure(record)
        end
    end
end