class RidingsController < ApplicationController
  def index
    @ridings = Riding.order("name").page(params[:page]).per(20)
  end

  def show
    @riding = Riding.find(params[:id])
    @total_organizations = @riding.organizations.count
    @mpp = @riding.member_of_provincial_parliament

    # page nav variables
    @previous = Riding.where("id < ?", params[:id]).order(:id).first
    @next = Riding.where("id > ?", params[:id]).order(:id).first
  end

  def organizations
    @riding = Riding.find(params[:id])
    @organizations = @riding.organizations
  end

  def get_my_riding
    postal_code = params[:postal_code]
    id = Riding.get_user_riding(postal_code)
    redirect_to riding_path(id)
  end
end