class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("name").page(params[:page]).per(20)

    respond_to do |format|
      format.html do
        if request.xhr?
          render @organizations
        else
          render 'index'
        end
      end

      format.js { render 'index' }
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @payments = @organization.transfer_payments
  end

  def search
    @results = Organization.fuzzy_search(params["fixed-header-drawer-exp"])
    render json: @results
  end

  # This endpoint is queried by the "org_funding_graph"
  def funding_data
    @organization = Organization.find(params[:id])
    @funding_data = @organization.funding_by_ministry
    render json: @funding_data
  end
end
