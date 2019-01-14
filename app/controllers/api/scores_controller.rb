class Api::ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token # Should verify in a real app

  def create
    @score = Score.new(score_params)
    if @score.save
      render json: @score, status: 201
    else
      render json: { errors: @score.errors.full_message }, status: 422
    end
  end

  def update_score
    @score = Score.find_by(home_team: score_params[:home_team],
                           away_team: score_params[:away_team])

    if @score.update(score_params)
      render json: @score, status: 201
    else
      render json: { errors: @score.errors.full_message }, status: 422
    end
  end

  private

  def score_params
    params.require(:score).permit(:home_team, :away_team, :home_score, :away_score)
  end
end
