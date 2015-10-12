class RidingsController < ApplicationController
  def index
    @ridings = Riding.order("name").page(params[:page]).per(20)

    respond_to do |format|
      format.html do
        if request.xhr?
          render @ridings
        else
          render 'index'
        end
      end

      format.js { render 'index' }
    end
  end

  def show
    @riding = Riding.find(params[:id])
    @total_organizations = @riding.organizations.count
    @mpp = @riding.member_of_provincial_parliament
    @previous = previous_riding
    @next = next_riding
  end

  # Nav action 'previous riding'
  def previous_riding
    @ridings = Riding.order("name")
    @previous = @ridings[@ridings.find_index(
      Riding.find(params[:id])) - 1
    ]
  end

  # Nav action 'next riding'
  def next_riding
    @ridings = Riding.order("name")
    unless @ridings[@ridings.find_index(Riding.find(params[:id])) + 1].nil?
      @next = @ridings[@ridings.find_index(
        Riding.find(params[:id])) + 1
      ]
    else
      @next = @ridings.first
    end
  end

  def search
    @results = Riding.fuzzy_search(params["fixed-header-drawer-exp"])
  end

  def organizations
    @riding = Riding.find(params[:id])
    @organizations = @riding.organizations
  end

  # Used on welcome#index to obtain a user's riding
  def get_my_riding
    postal_code = params[:postal_code]
    id = Riding.get_user_riding(postal_code)
    redirect_to riding_path(id)
  end
end