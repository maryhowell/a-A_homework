class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.fromTowerIdx = null;
    this.setupTowers();
    this.render();
    this.disapear();
  }


  clickTower(event) {
    const clickedTowerIdx = $(event.currentTarget).index();

    if (this.fromTowerIdx === null) {
      this.fromTowerIdx = clickedTowerIdx;

    } else {
      if (!this.game.move(this.fromTowerIdx, clickedTowerIdx)) {
        alert("Invalid move! Try again");
      }
      this.fromTowerIdx = null;
    }
    this.render();

    if (this.game.isWon()) {
      this.$el.off("click");
      this.$el.addClass("game-over");
      alert("Good Job!");
    }
  }

  disapear() {
    $('.title').on("click", e => {
      const $ti = $(e.currentTarget);
      $ti.hide(2000);
    });
  }

  setupTowers() {
    this.$el.empty();
    this.$el.addClass("group");

    const $ul = $("<ul>");
    for (let toweridx = 0; toweridx < 3; toweridx++) {
      let $tower = $("<ul>");

      for (var diskidx = 0; diskidx < 3; diskidx++) {
        let $disk = $("<li>");
        $tower.append($disk);
      }
      this.$el.append($tower);
    }
  }

  render() {
    const $towers = this.$el.find("ul");
    $towers.removeClass();

    if (this.fromTowerIdx !== null) {
      $towers.eq(this.fromTowerIdx).addClass("selected");
    }

    this.game.towers.forEach( (disks, towerIdx) => {
      const $disks = $towers.eq(towerIdx).children();
      $disks.removeClass();

      disks.forEach( (diskWidth, diskIdx) => {
        $disks.eq(-1 * (diskIdx + 1)).addClass(`disk-${diskWidth}`);
      });
    });
  }
}





module.exports = View;
