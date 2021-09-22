# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[edit destroy update]
  before_action :current_user
  before_action :admin

  def index
    @albums = Album.includes(:artist).all.order(:name).page(params[:page]).per(5)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = 'Album created successful!'
      redirect_to albums_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_album_path
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: 'Album succsses updated'
    else
      render :edit
    end
  end

  def destroy
    if @album.destroy
      redirect_to albums_path, notice: 'Album deleted!'
    else
      render :index
    end
  end

  private

  def album_params
    params.require(:album).permit(:artist_id, :name, :year)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
