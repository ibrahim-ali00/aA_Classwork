import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tabsIndex: 0,
    };
    console.log(props);
    this.moveTabs = this.moveTabs.bind(this);
  }
  moveTabs(idx) {
    this.setState({ tabsIndex: idx });
  }

  render() {

    const tabsArr = this.props.tabsArr.map((obj, idx) => {
      return (
        <ul key={obj.title}>
          <h1 onClick={() => this.moveTabs(idx)}>{obj.title}</h1>
        </ul>
      );
    });

    return (
      <div>
        {tabsArr}
        <article>{this.props.tabsArr[this.state.tabsIndex].content}</article>
      </div>
    );
  }
}

export default Tabs;
