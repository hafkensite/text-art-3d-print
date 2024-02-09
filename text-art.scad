module perletter(txt2, txt1, spacing=9) {
    intersection() {
        translate([-spacing*2,-spacing,0])
        cube([spacing*(len(txt1)+2),spacing*2,spacing*2]);
      translate([0,0,0.5])

  for (i = [0:len(txt1)]) {
    translate([i*spacing,0,0])
      intersection() {
        letter(txt1[i], 45);
        letter(txt2[i], -45);
      }
  }
  }
  translate([-4,-spacing/2,0])
cube([spacing*len(txt1),spacing,1.5]);
}

module letter(ltr, angle) {
    font=(ltr=="\u2665")?
        "Noto Sans Symbols 2:style=Regular":
        "Noto Sans Mono:style=Black";
      rotate([70,0,angle])
      linear_extrude(40, center=true, convexity=10)
      text(ltr,size=10, font=font, halign="center",$fn=36, spacing=1); 
}
//\u2665AMY\u2665
perletter(
  "REMI",
  "VOYS", spacing=10);

