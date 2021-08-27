class Clock {
  constructor() {
    const time = new Date();

    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();

    this.printTime();

    setInterval(this._tick.bind(this), 1000)
  }

  printTime() {
    console.log(`${this.hours} : ${this.minutes} : ${this.seconds}`)
  }

  _tick() {
    this._incrementSeconds();
    this.printTime()
  }

  _incrementSeconds() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this._incrementMinutes
    }
  }

  _incrementMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
      this.minutes = 0;
      this._incrementHours;
    }
  }

  _incrementHours() {
    this.hours = (this.hours + 1) % 24
  }

}