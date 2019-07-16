class Administrator::CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cd = Cd.includes(:disks => :musics).find(params[:id])
  end

  def new
    @cd = Cd.new
    @disk = @cd.disks.build
    @music = @disk.musics.build
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      redirect_to administrator_cds_path
    else
      render :new
    end
  end

  def edit
    @cd = Cd.includes(:disks => :musics).find(params[:id])
  end

  def update
    @cd = Cd.includes(:disks => :musics).find(params[:id])
    if @cd.update(cd_params)
      redirect_to administrator_cd_path(@cd.id)
    else
      render edit
    end
  end

  def destroy
    @cd = Cd.includes(:disks => :musics).find(params[:id])
    @cd.destroy
    redirect_to administrator_cds_path
  end

  private

  def cd_params
    params.require(:cd).permit(:name, :price, :stock, :image, :label_id, :genre_id, disks_attributes:[:id, :number, :_destroy, musics_attributes: [:id, :number, :name, :artist_id, :_destroy]])
  end

end
