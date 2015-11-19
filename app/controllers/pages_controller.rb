class PagesController < ApplicationController
  before_action :redirect_logged_in_user, only: :index

  def index
  end

  private

  def redirect_logged_in_user
    redirect_to resources_path if user_signed_in?
  end
end
