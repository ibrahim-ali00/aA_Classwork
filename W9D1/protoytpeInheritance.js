

Function.prototype.inherits = function(func) {
    // Make this inherit from func here.
    function Surrogate() {} 
    Surrogate.prototype = func.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
    return;
};



class MovingObject {

    constructor(name) {
        this.name = name;
    }

    moves() {
        console.log(`${this.name} moved a little!`); 
    }
}

const ras = new MovingObject('Ras');

class Ship extends MovingObject {

    constructor(name) {
        super(name);
    }

    sink() {
        console.log(`${this.name} sank in the ocean!`); 
    }
}


function Surrogate() {} 
Surrogate.prototype = MovingObject.prototype;
Ship.prototype = new Surrogate();
Ship.prototype.constructor = Ship;

const titanic = new Ship('Titanic');


// function Asteroid() {}
// Asteroid.inherits(MovingObject);