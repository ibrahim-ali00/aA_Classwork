class DOMNodeCollection {
    constructor(htmlElems) {
        this.htmlElems = htmlElems;
    }
};

DOMNodeCollection.prototype.html = function(str) {
    if (!str) {
        return this.htmlElems[0][0].innerHTML;
    } else {
        this.htmlElems[0].forEach((ele) => {
            ele.innerHTML = str;
        })
    }
};

DOMNodeCollection.prototype.empty = function() {
    this.htmlElems[0].forEach((ele) => {
        ele.innerHTML = "";
    })
};

DOMNodeCollection.prototype.append = function(...args) {
    this.htmlElems[0].forEach((ele) => {
        args.forEach((arg) => {
            if (typeof arg === 'string') {
                ele.innerHTML.concat(arg.outerHTML);
            } else if (arg instanceof HTML) {
                    ele.innerHTML = ele.innerHTML.concat(arg.outerHTML);
            } else {
                args.forEach((innerEl) => {
                    ele.innerHTML = ele.innerHTML.concat(innerEl.outerHTML)
                })
            }
        })
    })
};

DOMNodeCollection.prototype.attr = function(name, value) {
    if (!value) {
        return this.htmlElems[0][0].attribute;
    } else {
        this.htmlElems[0][0].attribute = value
    }
};

DOMNodeCollection.prototype.addClass = function() {

};

DOMNodeCollection.prototype.removeClass = function() {

};

DOMNodeCollection.prototype.find = function() {

};

DOMNodeCollection.prototype.children = function() {

};

DOMNodeCollection.prototype.parent = function() {

};

module.exports = DOMNodeCollection