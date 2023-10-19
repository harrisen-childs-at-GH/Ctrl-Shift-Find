module UserFileServices
    class AccessUserFileService < ApplicationService
        option :user_file_path, optional: false, type: Dry::Types['string']

        def call
            check_file_exist(user_file_path).bind(method(:read_user_file))
        end

        private

        def check_file_exist(user_file_path)
            return Success(user_file_path) if File.exists?(user_file_path)

            Failure("User File at path #{user_file_path} does not exist.")
        end

        def read_user_file(user_file_path)
            Success(File.read(user_file_path))
        end
    end
end