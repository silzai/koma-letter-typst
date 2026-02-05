
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

#show: koma-letter.with(
  //page setup
  justify-body: true,
  fold-mark-middle: true,
  fold-mark-topbottom: true,
  paper-size: "a4",
  koma-font: "New Computer Modern",
  koma-font-size: 12pt,
  //letter details
  letterhead: [
    Light Yagami \
    2-15-1 Sakura Heights, Apt. 304 \
    Nerima Ward, Tokyo 179-0081 \
    Japan \
    light.yagami\@to-oh.jp \
+81-90-1234-5678
  ],
  addressee: [
    TechCore Solutions Inc. \
    4th Floor, Yotsuba Tech Park \
    1-7-3 Shibuya, Tokyo 150-0002 \
    Japan
  ],
  date: datetime.today().display("[month repr:long] [day], [year]"),
  subject: [Application for Software Engineering Internship],
  opening: [Dear Hiring Manager and Hiring Team,],
  closing: [Thank you for your time,],
  signature: [Light Yagami],
) 
I am writing this letter to apply for the position of software engineer intern at your company. I am currently in my final semester in Computer Science at To-Oh University, and I’ve spent the past few years developing my skills in full-stack development, machine learning, and software architecture. The tools and frameworks I’m proficient in are listed on my CV.

During my internship with the National Police Agency, I worked on internal tooling that assisted in data handling and security audits. The experience gave me exposure to working on serious, mission-critical systems, and taught me the importance of accuracy, accountability, and thorough research in development.

I value clean code, thoughtful systems design, and working on projects that serve a meaningful purpose. I believe your company is a place where I can grow, contribute to real-world solutions, and continue refining my skills alongside a capable team.

I am available to begin working from the 1st of June, 2025, and I’m happy to interview at your earliest convenience.
