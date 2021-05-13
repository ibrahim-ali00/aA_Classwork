
class FollowToggle {
  constructor(el) {
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  render(){
    switch(this.followState){
      case 'followed':
        this.el.text('Unfollow!')
      break;
      case 'unfollowed':
        this.el.text('Follow!')
        break;
    }
  }

  handleClick(){
    this.el.on('click', (e) => {
      e.preventDefault();
      if(this.followState === 'followed'){
        APIUtil.
      }else{}

    })
  }
}

module.exports = FollowToggle;
