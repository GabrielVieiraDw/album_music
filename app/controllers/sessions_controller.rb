# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    unless user.present?
      raise ArgumentError,
            'Sorry, we could not find an account with this username. Please check you are using the right username and try again.'
    end

    user.authenticate(password: params[:password])

    session[:user_id] = user.id
    redirect_to artists_path, notice: 'Logged in!'
  rescue ArgumentError => e
    flash.now[:errors] = e
    render 'new'
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out!'
  end
end
