module RecordServices
    class UpdateRecordService < ApplicationService
        option :record, optional: false

        def call
            update_record(record)
        end

        private

        def update_record(record)
            return Success(record) if record.save
            Failure("Unable to update #{record.class.name} record")
        end
    end
end