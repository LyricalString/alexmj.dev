// Typographic helpers — two-column recruiter-facing CV.
// Header band, sidebar with contact/skills, main column with experience/projects.

#let bg = rgb("#ffffff")
#let sidebar-bg = rgb("#f4f3ee")
#let ink = rgb("#1a1d24")
#let ink-soft = rgb("#3a3f4a")
#let dim = rgb("#5a5f6a")
#let faint = rgb("#8a8f99")
#let rule = rgb("#d8d6cf")
#let accent = rgb("#2d5a4f")    // deep forest — serious, not corporate
#let accent-soft = rgb("#7ba893")

#let sans = "Geist"
#let mono = "Geist Mono"

// Section header for main column: accent bar + uppercase label
#let main-section(title) = {
  block(below: 14pt, above: 10pt, {
    grid(columns: (14pt, auto), column-gutter: 8pt, align: horizon,
      box(width: 14pt, height: 2pt, fill: accent),
      text(font: sans, size: 10.5pt, weight: 600, fill: accent, tracking: 0.6pt, upper(title)),
    )
  })
}

// Section header for sidebar: just uppercase, smaller
#let side-section(title) = {
  v(8pt)
  block(below: 8pt, text(font: sans, size: 9pt, weight: 600, fill: accent, tracking: 0.8pt, upper(title)))
}

// Experience entry
#let entry(company: "", role: "", dates: "", body, stack: "") = {
  block(below: 12pt, {
    grid(columns: (1fr, auto), column-gutter: 12pt, align: horizon,
      text(font: sans, size: 11pt, weight: 600, fill: ink, company),
      text(font: mono, size: 8pt, fill: dim, dates),
    )
    v(2pt)
    text(font: sans, size: 9.2pt, weight: 500, fill: accent, role)
    v(5pt)
    text(font: sans, size: 9.2pt, fill: ink-soft, body)
    if stack != "" {
      v(5pt)
      text(font: mono, size: 7.6pt, fill: faint, stack)
    }
  })
}

// Project — slightly more compact than entry
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
      text(font: mono, size: 7.4pt, fill: faint, stack)
    }
  })
}

// Sidebar skill row: stacked label + items
#let skill-block(label, items) = {
  block(below: 11pt, {
    text(font: sans, size: 8pt, weight: 600, fill: dim, tracking: 0.4pt, upper(label))
    v(3pt)
    text(font: mono, size: 8.2pt, fill: ink-soft, items)
  })
}

// Sidebar contact line: icon-style mono prefix + value
#let contact-line(label, value, url: none) = {
  block(below: 3pt, {
    text(font: mono, size: 7pt, fill: faint, tracking: 0.4pt, upper(label))
    linebreak()
    if url != none {
      link(url, text(font: mono, size: 8pt, fill: ink-soft, value))
    } else {
      text(font: mono, size: 8pt, fill: ink-soft, value)
    }
  })
}
