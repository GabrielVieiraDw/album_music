# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :admin

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def admin
    redirect_to root_url, notice: 'you are not logged in!' unless current_user.present?
  end
end
