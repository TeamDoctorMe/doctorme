class AdminController < ApplicationController
  before_action :_ensure_current_user_is_admin

  private

  def _ensure_current_user_is_admin
  end
end
