class Administrator::ArtistsController < ApplicationController
  def index
    @artist = Artist.new
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_administrator_cd_path
    else
      @artists = Artist.all
      render :index
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to administrator_artists_path
    else
      @artists = Artist.all
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    if @artist.destroy
      redirect_to administrator_artists_path
    else
      @artists = Artist.all
      render :index
    end
  end


  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
