class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :update]

  def show
    @rounds = @competition.number_of_rounds
    @not_invited_friends = current_user.not_invited_friends(@competition.id)
    # @matches = Match.where(competition_id: @competition.id)
    if @competition.category == "Knockout"
      @competition.winner_match_assignment
    elsif @competition.category == "League"
      @current_user_id = @current_user.id
      @matches = Match.all.where(competition_id: @competition.id)
      @competition_participants = @competition.competition_participants
      @competition_participants_by_points = @competition.competition_participants_by_points
      @league_table_data = @competition.league_table_data(@competition_participants_by_points)
    end
  end

  def new
    @competition = Competition.new
    @user = current_user
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.creator = current_user
    if @competition.save
      @competition.create_activity :create, owner: current_user
      @competition.number_of_rounds = @competition.number_of_rounds
      @competition.create_matches
      players_ary = params[:competition][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
      @competition.add_players(players_ary)
      @competition.assign_matches if @competition.players.count == @competition.number_of_players
      @competition.save
      CompetitionMailer.competition_created(@competition).deliver_now
      CompetitionMailer.invited_participants(@competition)
      render json: @competition, status: :created
    else
      render json: @competition.errors, status: :unprocessable_entity
    end
  end

  def update
    players_ary = params[:competition][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
    @competition.add_players(players_ary)
    @competition.assign_matches if @competition.players.count == @competition.number_of_players
    if @competition.save
      render json: @competition, status: :created
    else
      render json: @competition.errors, status: :unprocessable_entity
    end
  end

  private

  def competition_params
    params.require(:competition).permit(:category, :sport_id, :name, :number_of_players)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end
end
