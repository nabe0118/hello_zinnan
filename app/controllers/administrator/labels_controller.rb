class Administrator::LabelsController < ApplicationController
  def index
    @label = Label.new
    @labels = Label.all
  end

  def edit
    @label = Label.find(params[:id])
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to new_administrator_cd_path
    else
      @labels = Label.all
      render :index
    end
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to administrator_labels_path
    else
      @labels = Label.all
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    if @label.destroy
      redirect_to administrator_labels_path
    else
      @labels = Label.all
      render :edit
    end
  end


  private
    def label_params
      params.require(:label).permit(:name)
    end
end
