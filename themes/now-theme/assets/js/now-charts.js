window["charts"] = {

  "onclick_color_button": function(b) {
    if(b.dataset.state != "true") {
      var new_view = "now-img-" + b.dataset.view;
      var bts = document.getElementsByClassName("now-color-view-button");
      var cur_view;
      for (var i = 0; i < bts.length; i++) {
        var bt = bts[i];
        if(bt.dataset.state == "true") {
          bt.classList.remove("o-90");
          bt.classList.add("o-50");
          bt.dataset.state = "false";
          cur_view = "now-img-" + bt.dataset.view;
        }
      }

      // activate clicked button
      b.dataset.state = "true";
      b.classList.add("o-90");

      // Hide images in current view
      var imgs = document.getElementsByClassName(cur_view);
      for (var i = 0; i < imgs.length; i++) {
        var img = imgs[i];
        img.classList.add("dn");
      }

      // Show images in new view
      imgs = document.getElementsByClassName(new_view);
      for (var i = 0; i < imgs.length; i++) {
        var img = imgs[i];
        img.classList.remove("dn");
      }
    }
  },

  "sort_alpha": function(a, b) {
        var m1 = a.hero_name.toLowerCase();
        var m2 = b.hero_name.toLowerCase();
        if(m1 < m2) return -1;
        if(m1 > m2) return 1;
        return 0;
  },

  "refresh_grid": function(ctx, width, height, colors, sort_colors) {
    var total=0;
    Object.values(colors).forEach(function (num) {
      total += num;
    });
    ctx.clearRect(0,0,width,height);
    var y_start = 0;

    Object.keys(colors).sort(function(a,b){
        if(sort_colors) {
            if (a < b)
                return -1;
            if (a > b)
                return 1;
            return 0;
        }
        else {
            return colors[b]-colors[a];
        }
    }).forEach(function (hex) {
        var norm_val = colors[hex]/total;
        var color_height = norm_val * height;

        ctx.fillStyle = hex;
        ctx.fillRect(0, y_start, width, color_height);

        y_start += color_height;
    });
 },

 "refresh_circles": function(ctx, width, height, colors) {
    var total=0;

    var is_first = true;
    Object.values(colors).forEach(function (num) {
      if(is_first) {
        is_first = false;
        return;
      }
      total += num;
    });

    ctx.clearRect(0,0,width,height);

    var main_color = true;
    Object.keys(colors).sort((a,b)=>colors[b]-colors[a]).forEach(function (hex) {
        // the main color becomes the background.
        if(main_color) {
            ctx.fillStyle = hex;
            ctx.fillRect(0, 0, width, height);
            main_color = false;
            return;
        }
        var norm_val = colors[hex]/total;

        // position
        var xoffset = Math.floor(width*.1);
        var yoffset = Math.floor(height*.1);
        var x = Math.floor(Math.random()*(width*.8))+xoffset;
        var y = Math.floor(Math.random()*(height*.8))+yoffset;
        // size
        var diam = height * 4;
        var radius = Math.floor(norm_val*diam);

        ctx.beginPath();
        ctx.arc(x,y,radius,Math.PI*2,0,false);
        ctx.fillStyle = hex;
        ctx.fill();
        ctx.closePath();
    });
  }
};
