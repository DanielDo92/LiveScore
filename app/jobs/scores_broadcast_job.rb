class ScoresBroadcastJob < ApplicationJob
  queue_as :default

  def perform(score)
    ActionCable.server.broadcast "score_channel", message: "new_score"
  end
end
