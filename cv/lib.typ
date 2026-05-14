// v2 — refined sidebar hierarchy & vertical rhythm.
// Spacing system: intra-block 3pt · block-to-block 8-12pt · section 16pt.

#let bg = rgb("#ffffff")
#let sidebar-bg = rgb("#f4f3ee")
#let ink = rgb("#1a1d24")
#let ink-soft = rgb("#3a3f4a")
#let dim = rgb("#5a5f6a")
#let faint = rgb("#8a8f99")
#let rule = rgb("#cfcdc4")
#let accent = rgb("#2d5a4f")
#let accent-soft = rgb("#7ba893")

#let sans = "Geist"
#let mono = "Geist Mono"

// Main column section header — unchanged
#let main-section(title) = {
  block(below: 12pt, above: 8pt, {
    grid(columns: (14pt, auto), column-gutter: 8pt, align: horizon,
      box(width: 14pt, height: 2pt, fill: accent),
      text(font: sans, size: 10.5pt, weight: 600, fill: accent, tracking: 0.6pt, upper(title)),
    )
  })
}

// Sidebar section: thin rule above the label anchors the section visually
#let side-section(title) = {
  block(above: 16pt, below: 10pt, {
    line(length: 100%, stroke: 0.4pt + rule)
    v(6pt)
    text(font: sans, size: 9pt, weight: 600, fill: accent, tracking: 0.8pt, upper(title))
  })
}

#let entry(company: "", role: "", dates: "", body, stack: "") = {
  block(below: 14pt, {
    grid(columns: (1fr, auto), column-gutter: 12pt, align: horizon,
      [
        #text(font: sans, size: 11pt, weight: 600, fill: ink, company)
        #h(6pt)
        #text(font: sans, size: 10pt, weight: 500, fill: accent, role)
      ],
      text(font: mono, size: 8pt, fill: dim, dates),
    )
    v(6pt)
    text(font: sans, size: 9.2pt, fill: ink-soft, body)
    if stack != "" {
      v(6pt)
      text(font: mono, size: 7.6pt, fill: dim, stack)
    }
  })
}

#let project(name: "", year: "", body, stack: "") = {
  block(below: 10pt, {
    grid(columns: (1fr, auto), column-gutter: 12pt, align: horizon,
      text(font: sans, size: 10pt, weight: 600, fill: ink, name),
      text(font: mono, size: 7.8pt, fill: dim, year),
    )
    v(3pt)
    text(font: sans, size: 9pt, fill: ink-soft, body)
    if stack != "" {
      v(3pt)
      text(font: mono, size: 7.4pt, fill: dim, stack)
    }
  })
}

// Sub-label: sans bold ink (full contrast vs items in dim). Asymmetric spacing —
// 14pt above, 2pt below — so the label visually anchors to its own items, not
// to the previous block. Commas instead of · for clean wrap in the narrow column.
#let skill-block(label, items) = {
  let formatted = items.replace(" · ", ", ")
  block(above: 14pt, below: 0pt, {
    text(font: sans, size: 8pt, weight: 700, fill: ink, tracking: 0.6pt, upper(label))
    v(2pt)
    text(font: mono, size: 8.4pt, fill: ink-soft, formatted)
  })
}

#let edu-entry(school: "", degree: "", dates: "") = {
  block(below: 11pt, {
    text(font: sans, size: 8.8pt, weight: 600, fill: ink, school)
    v(3pt)
    text(font: sans, size: 8.2pt, fill: ink-soft, degree)
    if dates != "" {
      v(3pt)
      text(font: mono, size: 7.4pt, fill: dim, dates)
    }
  })
}

#let lang-entry(name, level) = {
  block(below: 5pt, {
    grid(columns: (1fr, auto), column-gutter: 8pt, align: horizon,
      text(font: sans, size: 9pt, weight: 600, fill: ink, name),
      text(font: mono, size: 7.8pt, fill: dim, level),
    )
  })
}

#let oss-entry(name: "", desc: "") = {
  block(below: 12pt, {
    text(font: sans, size: 9pt, weight: 600, fill: ink, name)
    v(3pt)
    text(font: sans, size: 8pt, fill: ink-soft, desc)
  })
}
