class TeamsController < ApplicationController
  def index
    @teams = Team.joins(:users)
  end

  def show
    @team = Team.find_by(slug: params[:slug])

    raise ActiveRecord::RecordNotFound if @team.nil?
  end
end
