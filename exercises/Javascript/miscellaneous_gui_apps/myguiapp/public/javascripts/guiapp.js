let MyGuiApp = {
  handleMouseLeave: function() {
    Array.from(this.images).forEach(image => {
      image.addEventListener('mouseleave', event => {
        let figCaption = event.target.nextElementSibling;
        if (this.timer) {
          clearTimeout(this.timer);
        }
        figCaption.style.display = 'none';
      });
    });
  },
  handleMouseOver: function() {
    Array.from(this.images).forEach(image => {
      image.addEventListener('mouseenter', event => {
        this.timer = setTimeout(() => {
          this.showToolTip(event);
        }, 2000);
      });
    });
  },
  showToolTip: function(event) {
    let figCaption = event.target.nextElementSibling;
    figCaption.style.display = 'block';
  },
  init: function(document) {
    this.document = document;
    this.images = document.getElementsByTagName('img');
    this.handleMouseOver();
    this.handleMouseLeave();
  }
}
document.addEventListener('DOMContentLoaded', function() {
  MyGuiApp.init(document);
});