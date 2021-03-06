var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
      active_tab: this.props.matches[0]["competition_participants"][0].id
    }
  },

  setNewMatch: function(data) {
    this.setState({fixtures: data["matches"]});
    this.props.updateTable(data["league_table_data"]);
  },

  handleTab: function(x) {
    this.setState({active_tab: x});
  },

  render: function() {
    var tabs = [];
    var players = this.props.matches[0]["competition_participants"];
    players.map(function(player, i){
        tabs.push(<PlayerTab player={player} key={i} handleClick={this.handleTab}
            active={this.state.active_tab} />);
    }.bind(this))

    var arr=[];
    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={this.state.fixtures}
          player={player} key={i} updateLeague={this.setNewMatch}
            active={this.state.active_tab} />);
    }.bind(this))

    return (
      <div className="tabs-and-fixtures">
        <div className="tabs">
          {tabs}
        </div>
        <div className="all-fixtures">
          {arr}
        </div>
      </div>
    );
  }
});
