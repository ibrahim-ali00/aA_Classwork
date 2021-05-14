const APIUtil = require("./api_util");

class UsersSearch {
    constructor() {
        this.el = $(el);
        this.input = $('nav input');
        this.ul = $(".users");
    }

    handleInput() {
        this.input.on("change", (e) => {
            APIUtil.searchUsers(this.input.val())
            .then()
        })
    }

    renderSearch(ele) {
        el
    }
}