class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("name").page(params[:page]).per(20)
  end

  def show
    @organization = Organization.find(params[:id])
    @payments = @organization.transfer_payments
  end

  def funding_data
    @organization = Organization.find(params[:id])
    @funding_data = @organization.funding_by_ministry
    render json: @funding_data
  end
end
