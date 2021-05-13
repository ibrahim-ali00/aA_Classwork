class View {
  constructor(game, $el) {
    this.game = game;
    this.$grid = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", (e) => {
      let square = e.target;
      let $square = $(square);
      let pos = $square.data("pos");
      if (!this.game.isOver()) {
        try {
          this.game.playMove(pos);
        } catch {
          alert("You can't do the same position");
        }
        this.makeMove($square);
      }
    });
  }

  makeMove($square) {
    let ourPlayer = this.game.currentPlayer;
    $square.text(`${this.game.currentPlayer}`);
    $square.css("background-color", "white");
    $square.css("text-transform", "capitalize");
    $square.css("justify-content", "center");
    $square.css("align-items", "center");
    $square.css("font-size", "50px");
    $square.css("font-family", "arial");
    $square.addClass(`${ourPlayer}`);
    if (this.game.isOver()) {
      if (this.game.winner()) {
        let $gameWin = $(`<p>${this.game.currentPlayer.toUpperCase()} wins! </p>`);
        let $h1 = $("h1");
        $h1.append($gameWin);
        $(`.${this.game.winner()}`).css("color", "red");
        $("li").css("background-color", "white");
        $(`.${this.game.currentPlayer}`).css("background-color", "green");
        $(`.${this.game.currentPlayer}`).css("color", "white");
      } else {
        $("li").css("color", "red");
        let $gameWin = $(`<p>It's a draw!</p>`);
        let $h1 = $("h1");
        $h1.append($gameWin);
      }
    }
  }

  setupBoard() {
    let $board = $("<ul>");
    for (let i = 0; i < 9; i++) {
      let row = Math.floor(i / 3);
      let col = i % 3;
      let pos = [row, col];
      let $li = $("<li></li>");
      $li.data("pos", pos);
      $board.append($li);
    }
    this.$grid.append($board);
    $("ul").css("display", "grid");
    $("ul").css("grid-template", " 1fr 1fr 1fr / 1fr 1fr 1fr");
    $("li").css("list-style", "none");
    $("li").css("background-color", "lightgrey");
    $("li").css("width", "150px");
    $("li").css("height", "150px");
    $("li").css("display", "flex");
    $("li").css("border", "1px solid black");
    $("ul").css("width", "450px");
    $("li").on("mouseover", (event) => {
      let item = event.target;
      let $item = $(item);
      if ($item.text() === "" && !this.game.isOver()) {
        $item.css("background-color", "yellow");
      }
    });
    $("li").on("mouseout", (event) => {
      let item = event.target;
      let $item = $(item);
      if ($item.text() === "" && !this.game.isOver()) {
        $item.css("background-color", "lightgrey");
      }
    });

    // $("li").hover(
    //   function () {
    //     $(this).css("background-color", "yellow");
    //   },
    //   function () {
    //     $(this).css("background-color", "lightgrew");
    //   }
    // );
  }
}

module.exports = View;
