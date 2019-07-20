class CdsController < ApplicationController
  def index
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(8)
  end
end
