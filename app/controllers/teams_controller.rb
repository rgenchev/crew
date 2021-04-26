class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(slug: params[:slug])

    raise ActiveRecord::RecordNotFound if @team.nil?
  end
end
