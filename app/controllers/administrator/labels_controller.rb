class Administrator::LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to new_administrator_cd_path
    else
      render :new
    end
  end

  private
    def label_params
      params.require(:label).permit(:name)
    end
end
