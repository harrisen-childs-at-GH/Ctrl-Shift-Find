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
    binding.pry
  end

  private

  def find_file_content
    UserFileServices::AccessUserFileService.call(user_file_path: @user_file.path)
  end
end
