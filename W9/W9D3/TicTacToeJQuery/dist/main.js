/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./nodeSolution/board.js":
/*!*******************************!*\
  !*** ./nodeSolution/board.js ***!
  \*******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MoveError = __webpack_require__(/*! ./moveError */ \"./nodeSolution/moveError.js\");\n\nclass Board {\n  constructor() {\n    this.grid = Board.makeGrid();\n  }\n\n  isEmptyPos(pos) {\n    if (!Board.isValidPos(pos)) {\n      throw new MoveError('Is not valid position!');\n    }\n\n    return (this.grid[pos[0]][pos[1]] === null);\n  }\n\n  isOver() {\n    if (this.winner() != null) {\n      return true;\n    }\n\n    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {\n      for (let colIdx = 0; colIdx < 3; colIdx++) {\n        if (this.isEmptyPos([rowIdx, colIdx])) {\n          return false;\n        }\n      }\n    }\n\n    return true;\n  }\n\n  placeMark(pos, mark) {\n    if (!this.isEmptyPos(pos)) {\n      throw new MoveError('Is not an empty position!');\n    }\n\n    this.grid[pos[0]][pos[1]] = mark;\n  }\n\n  print() {\n    const strs = [];\n    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {\n      const marks = [];\n      for (let colIdx = 0; colIdx < 3; colIdx++) {\n        marks.push(\n          this.grid[rowIdx][colIdx] ? this.grid[rowIdx][colIdx] : \" \"\n        );\n      }\n      strs.push(`${marks.join('|')}\\n`);\n    }\n\n    console.log(strs.join('-----\\n'));\n  }\n\n  winner() {\n    const posSeqs = [\n      // horizontals\n      [[0, 0], [0, 1], [0, 2]],\n      [[1, 0], [1, 1], [1, 2]],\n      [[2, 0], [2, 1], [2, 2]],\n      // verticals\n      [[0, 0], [1, 0], [2, 0]],\n      [[0, 1], [1, 1], [2, 1]],\n      [[0, 2], [1, 2], [2, 2]],\n      // diagonals\n      [[0, 0], [1, 1], [2, 2]],\n      [[2, 0], [1, 1], [0, 2]]\n    ];\n\n    for (let i = 0; i < posSeqs.length; i++) {\n      const winner = this.winnerHelper(posSeqs[i]);\n      if (winner != null) {\n        return winner;\n      }\n    }\n\n    return null;\n  }\n\n  winnerHelper(posSeq) {\n    for (let markIdx = 0; markIdx < Board.marks.length; markIdx++) {\n      const targetMark = Board.marks[markIdx];\n      let winner = true;\n      for (let posIdx = 0; posIdx < 3; posIdx++) {\n        const pos = posSeq[posIdx];\n        const mark = this.grid[pos[0]][pos[1]];\n\n        if (mark != targetMark) {\n          winner = false;\n        }\n      }\n\n      if (winner) {\n        return targetMark;\n      }\n    }\n\n    return null;\n  }\n\n  static isValidPos(pos) {\n    return (0 <= pos[0]) &&\n    (pos[0] < 3) &&\n    (0 <= pos[1]) &&\n    (pos[1] < 3);\n  }\n\n  static makeGrid() {\n    const grid = [];\n\n    for (let i = 0; i < 3; i++) {\n      grid.push([]);\n      for (let j = 0; j < 3; j++) {\n        grid[i].push(null);\n      }\n    }\n\n    return grid;\n  }\n}\n\nBoard.marks = ['x', 'o'];\n\nmodule.exports = Board;\n\n\n//# sourceURL=webpack:///./nodeSolution/board.js?");

/***/ }),

/***/ "./nodeSolution/game.js":
/*!******************************!*\
  !*** ./nodeSolution/game.js ***!
  \******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Board = __webpack_require__(/*! ./board */ \"./nodeSolution/board.js\");\nconst MoveError = __webpack_require__(/*! ./moveError */ \"./nodeSolution/moveError.js\");\n\nclass Game {\n  constructor() {\n    this.board = new Board();\n    this.currentPlayer = Board.marks[0];\n  }\n\n  isOver() {\n    return this.board.isOver();\n  }\n\n  playMove(pos) {\n    this.board.placeMark(pos, this.currentPlayer);\n    this.swapTurn();\n  }\n\n  promptMove(reader, callback) {\n    const game = this;\n\n    this.board.print();\n    console.log(`Current Turn: ${this.currentPlayer}`);\n\n    reader.question('Enter rowIdx: ', rowIdxStr => {\n      const rowIdx = parseInt(rowIdxStr);\n      reader.question('Enter colIdx: ', colIdxStr => {\n        const colIdx = parseInt(colIdxStr);\n        callback([rowIdx, colIdx]);\n      });\n    });\n  }\n\n  run(reader, gameCompletionCallback) {\n    this.promptMove(reader, move => {\n      try {\n        this.playMove(move);\n      } catch (e) {\n        if (e instanceof MoveError) {\n          console.log(e.msg);\n        } else {\n          throw e;\n        }\n      }\n\n      if (this.isOver()) {\n        this.board.print();\n        if (this.winner()) {\n          console.log(`${this.winner()} has won!`);\n        } else {\n          console.log('NO ONE WINS!');\n        }\n        gameCompletionCallback();\n      } else {\n        // continue loop\n        this.run(reader, gameCompletionCallback);\n      }\n    });\n  }\n\n  swapTurn() {\n    if (this.currentPlayer === Board.marks[0]) {\n      this.currentPlayer = Board.marks[1];\n    } else {\n      this.currentPlayer = Board.marks[0];\n    }\n  }\n\n  winner() {\n    return this.board.winner();\n  }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./nodeSolution/game.js?");

/***/ }),

/***/ "./nodeSolution/moveError.js":
/*!***********************************!*\
  !*** ./nodeSolution/moveError.js ***!
  \***********************************/
/***/ ((module) => {

eval("\nconst MoveError = function (msg) { this.msg = msg; };\n\n// MoveError really should be a child class of the built in Error object provided\n// by Javascript, but since we haven't covered inheritance yet, we'll just\n// let it be a vanilla Object for now!\n\nmodule.exports = MoveError;\n\n\n//# sourceURL=webpack:///./nodeSolution/moveError.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const View = __webpack_require__(/*! ./ttt-view.js */ \"./src/ttt-view.js\");\nconst Game = __webpack_require__(/*! ../nodeSolution/game.js */ \"./nodeSolution/game.js\");\nwindow.View = View;\nwindow.Game = Game;\n$(() => {\n  let game = new Game();\n  let $grid = $(\".ttt\");\n  let view = new View(game, $grid);\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/ttt-view.js":
/*!*************************!*\
  !*** ./src/ttt-view.js ***!
  \*************************/
/***/ ((module) => {

eval("class View {\n  constructor(game, $el) {\n    this.game = game;\n    this.$grid = $el;\n    this.setupBoard();\n    this.bindEvents();\n  }\n\n  bindEvents() {\n    $(\"li\").on(\"click\", (e) => {\n      let square = e.target;\n      let $square = $(square);\n      let pos = $square.data(\"pos\");\n      if (!this.game.isOver()) {\n        try {\n          this.game.playMove(pos);\n        } catch {\n          alert(\"You can't do the same position\");\n        }\n        this.makeMove($square);\n      }\n    });\n  }\n\n  makeMove($square) {\n    let ourPlayer = this.game.currentPlayer;\n    $square.text(`${this.game.currentPlayer}`);\n    $square.css(\"background-color\", \"white\");\n    $square.css(\"text-transform\", \"capitalize\");\n    $square.css(\"justify-content\", \"center\");\n    $square.css(\"align-items\", \"center\");\n    $square.css(\"font-size\", \"50px\");\n    $square.css(\"font-family\", \"arial\");\n    $square.addClass(`${ourPlayer}`);\n    if (this.game.isOver()) {\n      if (this.game.winner()) {\n        let $gameWin = $(`<p>${this.game.currentPlayer.toUpperCase()} wins! </p>`);\n        let $h1 = $(\"h1\");\n        $h1.append($gameWin);\n        $(`.${this.game.winner()}`).css(\"color\", \"red\");\n        $(\"li\").css(\"background-color\", \"white\");\n        $(`.${this.game.currentPlayer}`).css(\"background-color\", \"green\");\n        $(`.${this.game.currentPlayer}`).css(\"color\", \"white\");\n      } else {\n        $(\"li\").css(\"color\", \"red\");\n        let $gameWin = $(`<p>It's a draw!</p>`);\n        let $h1 = $(\"h1\");\n        $h1.append($gameWin);\n      }\n    }\n  }\n\n  setupBoard() {\n    let $board = $(\"<ul>\");\n    for (let i = 0; i < 9; i++) {\n      let row = Math.floor(i / 3);\n      let col = i % 3;\n      let pos = [row, col];\n      let $li = $(\"<li></li>\");\n      $li.data(\"pos\", pos);\n      $board.append($li);\n    }\n    this.$grid.append($board);\n    $(\"ul\").css(\"display\", \"grid\");\n    $(\"ul\").css(\"grid-template\", \" 1fr 1fr 1fr / 1fr 1fr 1fr\");\n    $(\"li\").css(\"list-style\", \"none\");\n    $(\"li\").css(\"background-color\", \"lightgrey\");\n    $(\"li\").css(\"width\", \"150px\");\n    $(\"li\").css(\"height\", \"150px\");\n    $(\"li\").css(\"display\", \"flex\");\n    $(\"li\").css(\"border\", \"1px solid black\");\n    $(\"ul\").css(\"width\", \"450px\");\n    $(\"li\").on(\"mouseover\", (event) => {\n      let item = event.target;\n      let $item = $(item);\n      if ($item.text() === \"\" && !this.game.isOver()) {\n        $item.css(\"background-color\", \"yellow\");\n      }\n    });\n    $(\"li\").on(\"mouseout\", (event) => {\n      let item = event.target;\n      let $item = $(item);\n      if ($item.text() === \"\" && !this.game.isOver()) {\n        $item.css(\"background-color\", \"lightgrey\");\n      }\n    });\n\n    // $(\"li\").hover(\n    //   function () {\n    //     $(this).css(\"background-color\", \"yellow\");\n    //   },\n    //   function () {\n    //     $(this).css(\"background-color\", \"lightgrew\");\n    //   }\n    // );\n  }\n}\n\nmodule.exports = View;\n\n\n//# sourceURL=webpack:///./src/ttt-view.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;