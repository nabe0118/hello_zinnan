class CdsController < ApplicationController
  def index
    @cds = Cd.page(params[:page]).per(9)
  end
end
