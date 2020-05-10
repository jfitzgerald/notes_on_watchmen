var refresh_grid = function(ctx, width, height, colors, sort_colors) {
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
        colors[hex] = colors[hex]/total;

        var color_height = colors[hex] * height;

        ctx.fillStyle = hex;
        ctx.fillRect(0, y_start, width, color_height);

        y_start += color_height;
    });
}

var refresh_circles = function(ctx, width, height, colors) {
    var total=0;
    Object.values(colors).forEach(function (num) {
      total += num;
    });
    ctx.clearRect(0,0,width,height);
    var main_color = true;
    Object.keys(colors).sort((a,b)=>colors[b]-colors[a]).forEach(function (hex) {
        colors[hex] = colors[hex]/total;

        // the main color becomes the background.
        if(main_color) {
            ctx.fillStyle = hex;
            ctx.fillRect(0, 0, width, height);
            main_color = false;
            return;
        }

        // position
        var xoffset = Math.floor(width*.1);
        var yoffset = Math.floor(height*.1);
        var x = Math.floor(Math.random()*(width*.8))+xoffset;
        var y = Math.floor(Math.random()*(height*.8))+yoffset;
        // size
        var diam = Math.floor(width/10)*Math.floor(height/10);
        var radius = Math.floor(colors[hex]*diam);

        ctx.beginPath();
        ctx.arc(x,y,radius,Math.PI*2,0,false);
        ctx.fillStyle = hex;
        ctx.fill();
        ctx.closePath();
    });
}
