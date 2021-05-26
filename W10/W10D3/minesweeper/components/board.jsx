import React from "react";
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tiles = this.props.board.grid.map((row, i) => {
      return (
        <div className="row" key={i}>
          {row.map((tile, j) => {
            return <Tile tile={tile} update={this.props.update} key_to={j} />;
          })}
        </div>
      );
    });
    return <div className="board">{tiles}</div>;
  }
}
