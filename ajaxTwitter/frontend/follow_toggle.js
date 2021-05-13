const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) {
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state");
    this.render();

    this.el.on("click", (e) => {
      this.handleClick(e);
    });
  }

  render() {
    switch (this.followState) {
      case "followed":
        this.el.text("Unfollow!");
        break;
      case "unfollowed":
        this.el.text("Follow!");
        break;
    }
  }

  handleClick(e) {
    // this.el.on("click", (e) => {
    //   e.preventDefault();
    //   if (this.followState === "followed") {
    //     $.ajax({
    //       type: "DELETE",
    //       url: "/users/:id/follow",
    //       success() {
    //         followState = "unfollowed";
    //         this.render();
    //       },
    //       error() {
    //         console.error("an error has occured");
    //       },
    //     });
    //   } else {
    //     $.ajax({
    //       type: "POST",
    //       url: "/users/:id/follow",
    //       success: function success() {
    //         followState = "followed";
    //         this.render();
    //       },
    //       error() {
    //         console.error("an error has occured");
    //       }
    //     });
    //   }
    // });

    e.preventDefault();

    if (this.followState === "unfollowed") {
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
    } else {
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
    }
  }
}

module.exports = FollowToggle;
