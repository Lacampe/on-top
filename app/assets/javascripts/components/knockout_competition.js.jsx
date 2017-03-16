var KnockoutCompetition = React.createClass({
  render: function() {
    var round_number = 1


    <div class="container-competition-table">
  <% round_number = 1 %>
  <% until round_number - 1 == @rounds do %>
  <div class=<%= "flex-" + "#{@rounds}" %>>
    <% @competition.matches.order("match_number asc").select { |r| r.round == round_number }.each do |match| %>
    <%= react_component "Match", { match: render(partial: 'matches/match', formats: :json, locals: {match: match})} %>
    <% end %>
  </div>
  <% round_number += 1 %>
  <% end %>
</div>

  }
})
