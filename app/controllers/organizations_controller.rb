class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("name").page(params[:page]).per(20)
  end

  def show
    @organization = Organization.find(params[:id])
    @payments = @organization.transfer_payments
    @funding_data = @organization.funding_by_ministry
  end
end
