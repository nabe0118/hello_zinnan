class Administrator::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_administrator_cd_path
    else
      render :new
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
