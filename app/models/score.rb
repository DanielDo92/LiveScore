class Score < ApplicationRecord
  validates :home_team, :away_team, :home_score, :away_score, presence: true
  validates :home_team, uniqueness: { scope: :away_team }

  after_create_commit { ScoresBroadcastJob.perform_later self }
  after_update_commit { ScoresBroadcastJob.perform_later self }
end
