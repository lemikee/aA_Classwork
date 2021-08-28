export default class Bird {
    constructor(dimensions){
        this.velocity = 0;
        this.dimensions = dimensions;
        this.x = this.dimensions.width / 2;
        this.y = this.dimensions.height /3;
    }

    const CONSTANTS = {
        GRAVITY:  0.8,
        FLAP_SPEED:  -8,
        TERMINAL_VEL:  12,
        BIRD_WIDTH:  40,
        BIRD_HEIGHT:  30
    };
    

    drawBird(ctx){
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.x, this.y, 40, 30);
    }

    animate(ctx){
        this.moveBird();
        this.drawBird(ctx)
    }

    moveBird() {
        this.y += this.velocity;
        this.velocity += 0.5;
    }

    flap() {
        this.velocity = -8;
    }
}