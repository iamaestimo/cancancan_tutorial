class ApplicationController < ActionController::Base
  before_action :set_current_user

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  private

  def set_current_user
    Current.user = current_user
  end
end