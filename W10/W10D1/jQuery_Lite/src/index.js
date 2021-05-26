const DNC = require('./dom_node_collection')

function $l(selector) {
    let nodeList;
    if (typeof selector === 'string') {
        nodeList = new Array(document.querySelectorAll(selector));
    } else if (selector instanceof HTML) {
        nodeList = new Array(selector);
    }
    return new DNC(nodeList);
};

window.$l = $l;