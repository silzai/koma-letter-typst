
#let koma-letter(
  //page setup
  paper-size: "a4",
  koma-font: "New Computer Modern",
  koma-font-size: 12pt,
  fold-mark-middle: false,
  fold-mark-topbottom: false,
  justify-body: true,
  //letter details
  letterhead: none,
  addressee: none,
  date: datetime.today().display("[month repr:long] [day], [year]"),
  subject: none,
  opening: [Dear,],
  closing: [Thank you for your time,],
  signature: none,
  doc
) = {
  set page(
  paper: paper-size,
  margin: (
    top: 0mm,
    bottom: 0mm,
    left: 0mm,
    right: 00mm
  ),
)

set text(
  font: koma-font,
  size: koma-font-size
)
set par(
  leading: 0.65em,
  spacing: 1.5em,
  first-line-indent: 1em,
  justify: justify-body
)

grid(
  columns: (1fr, 170mm, 1fr),
  rows: (8mm, 55mm, 36mm),
  gutter: 0pt,
  none,
  none,
  none,
// Letterhead
  none,
  grid.cell(
    letterhead,
    stroke: 0mm,
  ),
  none,
// addressee
  none,
  addressee,
  none,
)
// new grid for reference field lines, letter body etc.
v(0pt, weak: true)
grid(
  columns: (1fr, 158mm, 1fr),
  rows: (14mm, 151mm),
  gutter: 0pt,
  none,
// date
  align(right + top)[#date],
  none,
// body
  none,
  [
    *#subject* \ \ \
    #opening \ \
    #doc \ \
    #set par(hanging-indent: 3.2em, first-line-indent: 0em)
    #closing \ \
    #signature
  ],
  none,
)
// footer
v(0pt, weak: true)
grid(
    columns: (1fr, 170mm, 1fr),
    rows: (auto),
    gutter: 0pt,
    none, none, none
)
}
