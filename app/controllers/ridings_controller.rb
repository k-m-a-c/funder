class RidingsController < ApplicationController
  def index
    @ridings = Riding.all
  end
  def show
    @riding = Riding.find(params[:id])
    @mpp = @riding.member_of_provincial_parliament
  end
end
