class UserFilesController < ApplicationController
  def index
  end

  def show
    @user_file = UserFile.find(params[:id])
  end

  def new
  end

  def create
  end
end
