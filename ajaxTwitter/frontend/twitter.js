const FollowToggle = require("./follow_toggle");
$(() => {
    
    const buttons = $("button.follow-toggle");
    const buttonsArray = [];
    buttons.each((_, ele) => {
        buttonsArray.push(new FollowToggle(ele));
    })
})

