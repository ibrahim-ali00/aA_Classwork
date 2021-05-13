
function View(game, $ele) {
    this.game = game;
    this.$ele = $ele;
    this.setupTowers();
}

View.prototype.setupTowers = function () {
    for (i = 0; i < 3; i++) {
        let $ul = $("<p>");
        for (j = 0; j < 3; j++) {
            let $li = $("<li>");
            $ul.append($li);
        }
        this.$ele.append($ul);
    }
}

View.prototype.render = function () {

}

module.exports = View