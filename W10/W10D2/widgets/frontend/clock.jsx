import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    let date = new Date();
    this.state = {
      date: date,
    };
    this.tick = this.tick.bind(this);
    // console.log(date);
  }

  componentDidMount() {
    this.intevervalID = setInterval(() => this.tick(), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intevervalID);
  }

  tick() {
    this.setState({ date: new Date() });
  }

  render() {
    const { date } = this.state;
    return (
      <div id="outer-container">
        <h1>Clock</h1>
        <div id="inner-container">
          <ul>
            <li>Time: </li>
            <li>{date.toLocaleTimeString()}</li>
          </ul>
          <ul>
            <li>Date: </li>
            <li>{date.toLocaleDateString()}</li>
          </ul>
        </div>
      </div>
    );
  }
}

export default Clock;
