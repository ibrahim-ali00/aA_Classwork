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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DOMNodeCollection {\n    constructor(htmlElems) {\n        this.htmlElems = htmlElems;\n    }\n};\n\nDOMNodeCollection.prototype.html = function(str) {\n    if (!str) {\n        return this.htmlElems[0][0].innerHTML;\n    } else {\n        this.htmlElems[0].forEach((ele) => {\n            ele.innerHTML = str;\n        })\n    }\n};\n\nDOMNodeCollection.prototype.empty = function() {\n    this.htmlElems[0].forEach((ele) => {\n        ele.innerHTML = \"\";\n    })\n};\n\nDOMNodeCollection.prototype.append = function(...args) {\n    this.htmlElems[0].forEach((ele) => {\n        args.forEach((arg) => {\n            if (typeof arg === 'string') {\n                ele.innerHTML.concat(arg.outerHTML);\n            } else if (arg instanceof HTML) {\n                    ele.innerHTML = ele.innerHTML.concat(arg.outerHTML);\n            } else {\n                args.forEach((innerEl) => {\n                    ele.innerHTML = ele.innerHTML.concat(innerEl.outerHTML)\n                })\n            }\n        })\n    })\n};\n\nDOMNodeCollection.prototype.attr = function(name, value) {\n    if (!value) {\n        return this.htmlElems[0][0].attribute;\n    } else {\n        this.htmlElems[0][0].attribute = value\n    }\n};\n\nDOMNodeCollection.prototype.addClass = function() {\n\n};\n\nDOMNodeCollection.prototype.removeClass = function() {\n\n};\n\nDOMNodeCollection.prototype.find = function() {\n\n};\n\nDOMNodeCollection.prototype.children = function() {\n\n};\n\nDOMNodeCollection.prototype.parent = function() {\n\n};\n\nmodule.exports = DOMNodeCollection\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const DNC = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\")\n\nfunction $l(selector) {\n    let nodeList;\n    if (typeof selector === 'string') {\n        nodeList = new Array(document.querySelectorAll(selector));\n    } else if (selector instanceof HTML) {\n        nodeList = new Array(selector);\n    }\n    return new DNC(nodeList);\n};\n\nwindow.$l = $l;\n\n//# sourceURL=webpack:///./src/index.js?");

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