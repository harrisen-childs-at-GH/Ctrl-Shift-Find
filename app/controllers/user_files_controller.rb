class UserFilesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def show
    @user_file = UserFile.find(params[:id])
    @file_content = find_file_content.success
  end

  def new
  end

  def create
  end

  def ask_question
    @user_file = UserFile.find(params[:user_file_id])
    @question_text = params[:question_text]

    Ai::QueryGptService.call(user_file: @user_file, prompt: @question_text) do |result|
      result.success do |answer|
        respond_to do |formats|
          formats.turbo_stream do
            redirect_to user_file_url(@user_file.id), notice: 'Answered!'
          end
        end
      end
      result.failure do
        redirect_to user_file_url(@user_file.id), notice: 'There was an issue...'
      end
    end
  end

  private

  def find_file_content
    UserFileServices::AccessUserFileService.call(user_file_path: @user_file.path)
  end
end
