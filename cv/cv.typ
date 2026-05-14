#import "lib.typ": *
#import "data.typ": person, summary, experience, projects, oss, skills, languages, education

#set document(title: "CV — " + person.name, author: person.name)

#let header-h = 40mm
#let sidebar-w = 64mm
#let page-w = 210mm
#let page-h = 297mm
#let photo-d = 26mm

#set page(
  paper: "a4",
  margin: (top: header-h + 7mm, bottom: 8mm, left: sidebar-w + 11mm, right: 14mm),
  fill: bg,
  background: {
    place(top + left, rect(width: page-w, height: header-h, fill: accent))
    place(top + left, dy: header-h, rect(width: sidebar-w, height: page-h - header-h, fill: sidebar-bg))
  },
  foreground: {
    place(top + left, dx: 16mm, dy: (header-h - photo-d) / 2,
      box(width: photo-d, height: photo-d, clip: true, radius: photo-d / 2,
        stroke: 1.5pt + white,
        image("photo.png", width: photo-d, height: photo-d, fit: "cover"),
      )
    )

    place(top + left, dx: 16mm + photo-d + 10mm, dy: 0mm,
      box(width: page-w - 32mm - photo-d - 10mm, height: header-h, {
        set align(horizon)
        grid(columns: (1fr, auto), column-gutter: 12pt, align: bottom + left,
          [
            #text(font: sans, size: 26pt, weight: 600, tracking: -0.6pt, fill: white, person.name)
            #v(2pt)
            #text(font: sans, size: 11pt, weight: 400, fill: rgb("#cce0d6"), person.role + "  ·  " + person.location)
          ],
          align(right + bottom)[
            #text(font: mono, size: 8.2pt, fill: rgb("#cce0d6"), [
              #link("mailto:" + person.email)[#person.email] \
              #link("https://" + person.site)[#person.site] \
              #link("https://" + person.github)[github.com/lyricalstring] \
              #link("https://" + person.linkedin)[linkedin.com/in/lyricalstring]
            ])
          ]
        )
      })
    )

    // ── SIDEBAR ──
    place(top + left, dx: 9mm, dy: header-h + 8mm, box(width: sidebar-w - 18mm, {

      // First section: no top rule needed — sits flush under header band.
      block(below: 10pt, text(font: sans, size: 9pt, weight: 600, fill: accent, tracking: 0.8pt, upper("Stack")))
      for (label, items) in skills {
        skill-block(label, items)
      }

      side-section("Education")
      for ed in education {
        edu-entry(school: ed.school, degree: ed.degree, dates: ed.dates)
      }

      side-section("Languages")
      for l in languages {
        lang-entry(l.at(0), l.at(1))
      }

      side-section("Open source")
      for o in oss {
        oss-entry(name: o.name, desc: o.desc)
      }
    }))
  },
)

#set text(font: sans, size: 9.5pt, fill: ink, lang: "en")
#set par(leading: 0.6em, justify: false)
#show link: it => underline(stroke: 0.4pt + faint, offset: 1.5pt, it)

#main-section("Summary")
#text(font: sans, size: 9.5pt, fill: ink-soft, summary)
#v(4pt)

#main-section("Experience")
#for e in experience {
  entry(company: e.company, role: e.role, dates: e.dates, stack: e.stack)[#e.body]
}

#v(2pt)
#main-section("Selected projects")
#for p in projects {
  project(name: p.name, year: p.year)[#p.body]
}
