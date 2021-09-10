# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :current_user
  before_action :admin

  def index
    @artists = Artist.all.order(:name).page(params[:page]).per(10)
  end
end
