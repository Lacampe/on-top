json.extract! match, :id, :competition_id, :match_number, :round, :player_one, :player_two, :status, :score, :winner ,:score_params, :competition_participants, :competition

# json.players do
#   json.extract! match.players, :profile_picture
# end

# json.competition do
#   json.extract! match.competition, :id
# end

# json.array!(matches) do |json, match|
#   json.(match, :id, :name)
# end

# json.player_one do
#   json.extract! match.players, :id
# end
