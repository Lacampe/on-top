var PlayerFixtures = React.createClass({
  getInitialState: function(){
    return{
      player: this.props.player
    };
  },

  render: function() {
    var player_matches = [];
    var player = this.props.player;

    {this.props.fixtures.map(function(match, j){
      if (match.player_one.id === player.id || match.player_two.id === player.id) {
          player_matches.push(<Match match={match} key={j} score_params={match.score_params} />);
      }
    })}

    return (
      <div className="fixtures hidden" id={player.first_name}>
        {player_matches}
      </div>
    )
  }
})