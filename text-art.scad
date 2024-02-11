module perletter(txt2, txt1, spacing=9) {
    intersection() {
        translate([-spacing*2,-spacing*10,0])
        cube([spacing*(len(txt1)+2),spacing*20,spacing*2]);
      translate([0,0,0])

  for (i = [0:len(txt1)]) {
    a = i-(len(txt1)/2);
    translate([i*spacing,0,0])
      intersection() {
        letter(txt1[i], 25-a*4);
        letter(txt2[i], -25-a*4);
      }
  }
  }
  translate([-4,-spacing/2,0])
cube([spacing*(0.5+len(txt1)),spacing,1]);
}

module letter(ltr, angle) {
    font=(ltr=="\u2665")?
        "Noto Sans Symbols 2:style=Regular":
        "Noto Sans Mono:style=Black";
      rotate([80, 0, angle])
      linear_extrude(500, center=true, convexity=20, scale=0.01)
      text(ltr, size=12, font=font, halign="center", $fn=36*2, spacing=1);
}
//\u2665AMY\u2665
scale(1.5)
perletter(
  "OSCAR",
  "NORAH", spacing=5);
