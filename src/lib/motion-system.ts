/**
 * Motion system — GSAP + Lenis animations.
 * Loaded as a client-side module via Base.astro <script type="module" src> tag.
 */

import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import Lenis from "@studio-freight/lenis";

gsap.registerPlugin(ScrollTrigger);

const prefersReducedMotion = window.matchMedia(
  "(prefers-reduced-motion: reduce)"
).matches;

if (!prefersReducedMotion) {
  const lenis = new Lenis({
    lerp: 0.08,
    duration: 1.2,
    smoothWheel: true,
  });
  lenis.on("scroll", ScrollTrigger.update);
  gsap.ticker.add((time) => lenis.raf(time * 1000));
  gsap.ticker.lagSmoothing(0);
}

// Home page hero
if (document.querySelector(".whoami-line")) {
  if (!prefersReducedMotion) {
    const tl = gsap.timeline({ defaults: { ease: "power3.out" } });
    tl.fromTo(
      ".whoami-line",
      { opacity: 0, y: 15 },
      { opacity: 1, y: 0, duration: 0.5 }
    )
      .fromTo(
        ".hero-h1",
        { opacity: 0, y: 30 },
        { opacity: 1, y: 0, duration: 0.7 },
        "-=0.2"
      )
      .fromTo(
        ".hero-meta",
        { opacity: 0, y: 10 },
        { opacity: 1, y: 0, duration: 0.4 },
        "-=0.3"
      )
      .fromTo(
        ".stats-strip",
        { opacity: 0, y: 20 },
        { opacity: 1, y: 0, duration: 0.5 },
        "-=0.2"
      );

    gsap.fromTo(
      ".work-row",
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        duration: 0.5,
        stagger: 0.08,
        ease: "power2.out",
        scrollTrigger: {
          trigger: ".work-row",
          start: "top bottom-=15%",
          toggleActions: "play none none none",
        },
      }
    );
  } else {
    gsap.set(
      ".whoami-line, .hero-h1, .hero-meta, .stats-strip, .work-row",
      { opacity: 1, y: 0 }
    );
  }
}

// Case study hero
if (document.querySelector(".hero-tag")) {
  if (!prefersReducedMotion) {
    const tl = gsap.timeline({ defaults: { ease: "power3.out" } });
    tl.fromTo(
      ".hero-tag",
      { opacity: 0, y: 10 },
      { opacity: 1, y: 0, duration: 0.4 }
    )
      .fromTo(
        ".hero-meta",
        { opacity: 0, y: 15 },
        { opacity: 1, y: 0, duration: 0.5 },
        "-=0.2"
      )
      .fromTo(
        ".hero-h1",
        { opacity: 0, y: 30 },
        { opacity: 1, y: 0, duration: 0.7 },
        "-=0.3"
      )
      .fromTo(
        ".hero-lead",
        { opacity: 0, y: 15 },
        { opacity: 1, y: 0, duration: 0.5 },
        "-=0.3"
      )
      .fromTo(".hero-links", { opacity: 0 }, { opacity: 1, duration: 0.4 }, "-=0.3");
  } else {
    gsap.set(
      ".hero-tag, .hero-meta, .hero-h1, .hero-lead, .hero-links",
      { opacity: 1, y: 0 }
    );
  }
}

// Reveal sections (all pages)
if (!prefersReducedMotion) {
  document.querySelectorAll(".reveal-section").forEach((section) => {
    const items = section.querySelectorAll(".reveal-item");
    if (items.length > 0) {
      gsap.fromTo(
        items,
        { opacity: 0, y: 24 },
        {
          opacity: 1,
          y: 0,
          duration: 0.6,
          stagger: 0.06,
          ease: "power3.out",
          scrollTrigger: {
            trigger: section,
            start: "top bottom-=10%",
            toggleActions: "play none none none",
          },
        }
      );
    }
  });
} else {
  gsap.set(".reveal-item", { opacity: 1, y: 0 });
}

// Magnetic hover
if (!prefersReducedMotion) {
  document
    .querySelectorAll(".work-row, .other-row, .case-badge")
    .forEach((el) => {
      el.addEventListener("mousemove", (e: Event) => {
        const me = e as MouseEvent;
        const rect = el.getBoundingClientRect();
        const x = me.clientX - rect.left - rect.width / 2;
        const y = me.clientY - rect.top - rect.height / 2;
        gsap.to(el, {
          x: x * 0.15,
          y: y * 0.15,
          duration: 0.3,
          ease: "power2.out",
        });
      });
      el.addEventListener("mouseleave", () => {
        gsap.to(el, {
          x: 0,
          y: 0,
          duration: 0.5,
          ease: "elastic.out(1, 0.5)",
        });
      });
    });
}
