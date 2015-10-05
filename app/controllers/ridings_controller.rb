class RidingsController < ApplicationController
  def index
    @ridings = Riding.order("name").page(params[:page]).per(20)
  end

  def show
    @riding = Riding.find(params[:id])
    @total_organizations = @riding.organizations.count
    @mpp = @riding.member_of_provincial_parliament
    @previous = previous_riding
    @next = next_riding
  end

  def previous_riding
    @ridings = Riding.order("name")
    @previous = @ridings[@ridings.find_index(
      Riding.find(params[:id])) - 1
    ]
  end

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