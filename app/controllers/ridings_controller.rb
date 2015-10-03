class RidingsController < ApplicationController
  def index
    @ridings = Riding.order("name").page(params[:page]).per(20)
  end
  def show
    @riding = Riding.find(params[:id])
    @mpp = @riding.member_of_provincial_parliament
  end
end