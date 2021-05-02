class TeamsController < ApplicationController
  before_action :set_index_crumbs, only: [:index, :show]

  def index
    @teams = Team.joins(:users)
  end

  def show
    @team = Team.find_by(slug: params[:slug])

    raise ActiveRecord::RecordNotFound if @team.nil?

    add_breadcrumb @team.name, team_url(@team)
  end

  private

  def set_index_crumbs
    add_breadcrumb "Teams", teams_url
  end
end
