var NewLeague = React.createClass({
  getInitialState: function() {
    return {
      complete: false
    }
  },

  handleChange: function(e) {
    this.setState({complete: true})
  },

  render: function() {
    var complete = this.state.complete;
    var stepThree;

    if (complete === true) {
      stepThree = (
      <SelectPlayers competition={this.props.competition}
        friends={this.props.friends}/>
      )
    };

    return (
      <div>
        <label for="number-of-players">Choose # of players:</label>
        <select name={this.props.competition.number_of_players}
          id="number-of-players" onChange={this.handleChange} >
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
        </select>
        <div>
          {stepThree}
        </div>
      </div>
    );
  }
})