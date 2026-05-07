/**
 * Motion system — Lenis smooth scroll + GSAP ScrollTrigger + animation utilities.
 *
 * Design principles:
 * - Motion clarifies, never decorates
 * - Subtle easing (power3.out), 600-800ms durations
 * - Stagger reveals for lists, parallax for numbers
 * - Respects prefers-reduced-motion
 * - Lazy-init: animations only fire when elements are visible
 */

import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import Lenis from "@studio-freight/lenis";

gsap.registerPlugin(ScrollTrigger);

// ── Reduced motion check ────────────────────────────────────────────
const prefersReducedMotion = () =>
  window.matchMedia("(prefers-reduced-motion: reduce)").matches;

// ── Lenis smooth scroll ─────────────────────────────────────────────
let lenis: Lenis | null = null;

export function initLenis(options: { lerp?: number; duration?: number } = {}) {
  if (prefersReducedMotion()) return null;

  lenis = new Lenis({
    lerp: options.lerp ?? 0.08,
    duration: options.duration ?? 1.2,
    smoothWheel: true,
  });

  lenis.on("scroll", ScrollTrigger.update);
  gsap.ticker.add((time: number) => lenis?.raf(time * 1000));
  gsap.ticker.lagSmoothing(0);

  return lenis;
}

export function lenisScrollTo(target: number | string, options?: { offset?: number }) {
  if (!lenis) return;
  lenis.scrollTo(target, { offset: options?.offset });
}

// ── Text splitting (lightweight SplitType replacement) ──────────────
export function splitText(el: HTMLElement, type: "chars" | "words" = "words") {
  const children: HTMLElement[] = [];
  const text = el.textContent || "";

  if (type === "words") {
    const words = text.split(/(\s+)/);
    el.innerHTML = "";
    words.forEach((word) => {
      if (word === "") return;
      if (/\s/.test(word)) {
        el.appendChild(document.createTextNode(word));
      } else {
        const span = document.createElement("span");
        span.className = "word";
        span.textContent = word;
        el.appendChild(span);
        children.push(span);
      }
    });
  } else {
    el.innerHTML = "";
    for (let i = 0; i < text.length; i++) {
      const char = text[i];
      const span = document.createElement("span");
      span.className = "char";
      span.textContent = char === " " ? "\u00A0" : char;
      el.appendChild(span);
      children.push(span);
    }
  }

  return children;
}

// ── Reveal animations ───────────────────────────────────────────────

export function revealUp(
  selector: string,
  options: {
    delay?: number;
    duration?: number;
    stagger?: number;
    opacityFrom?: number;
    yFrom?: number;
  } = {}
) {
  if (prefersReducedMotion()) {
    gsap.set(selector, { opacity: 1, y: 0 });
    return;
  }

  const {
    delay = 0,
    duration = 0.7,
    stagger = 0,
    opacityFrom = 0,
    yFrom = 30,
  } = options;

  gsap.fromTo(
    selector,
    { opacity: opacityFrom, y: yFrom },
    {
      opacity: 1,
      y: 0,
      duration,
      delay,
      stagger,
      ease: "power3.out",
      scrollTrigger: {
        trigger: selector,
        start: "top bottom-=10%",
        toggleActions: "play none none none",
      },
    }
  );
}

export function revealFade(selector: string, delay = 0) {
  if (prefersReducedMotion()) {
    gsap.set(selector, { opacity: 1 });
    return;
  }

  gsap.fromTo(
    selector,
    { opacity: 0 },
    {
      opacity: 1,
      duration: 0.5,
      delay,
      ease: "power2.out",
      scrollTrigger: {
        trigger: selector,
        start: "top bottom-=15%",
        toggleActions: "play none none none",
      },
    }
  );
}

export function revealChars(
  selector: string,
  options: { delay?: number; duration?: number; stagger?: number } = {}
) {
  if (prefersReducedMotion()) {
    gsap.set(selector, { opacity: 1, y: 0 });
    return;
  }

  const { delay = 0, duration = 0.6, stagger = 0.02 } = options;
  const el = document.querySelector(selector);
  if (!el) return;

  const chars = splitText(el as HTMLElement, "chars");
  if (chars.length === 0) return;

  gsap.fromTo(
    chars,
    { opacity: 0, y: 20 },
    {
      opacity: 1,
      y: 0,
      duration,
      delay,
      stagger,
      ease: "power3.out",
      scrollTrigger: {
        trigger: el,
        start: "top bottom-=10%",
        toggleActions: "play none none none",
      },
    }
  );
}

// ── Hero animations (page load, not scroll) ─────────────────────────

export function animateHero() {
  if (prefersReducedMotion()) {
    gsap.set(".whoami-line, .hero-h1, .hero-meta, .stats-strip", {
      opacity: 1,
      y: 0,
    });
    return;
  }

  const tl = gsap.timeline({ defaults: { ease: "power3.out" } });

  tl.fromTo(".whoami-line", { opacity: 0, y: 15 }, { opacity: 1, y: 0, duration: 0.5 })
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
}

// ── Work rows stagger ───────────────────────────────────────────────

export function animateWorkRows(selector = ".work-row") {
  if (prefersReducedMotion()) {
    gsap.set(selector, { opacity: 1 });
    return;
  }

  gsap.fromTo(
    selector,
    { opacity: 0, y: 20 },
    {
      opacity: 1,
      y: 0,
      duration: 0.5,
      stagger: 0.08,
      ease: "power2.out",
      scrollTrigger: {
        trigger: selector,
        start: "top bottom-=15%",
        toggleActions: "play none none none",
      },
    }
  );
}

// ── Number counter animation ────────────────────────────────────────

export function animateCounter(
  selector: string,
  target: number,
  options: {
    duration?: number;
    suffix?: string;
    prefix?: string;
    decimals?: number;
  } = {}
) {
  if (prefersReducedMotion()) return;

  const {
    duration = 1.2,
    suffix = "",
    prefix = "",
    decimals = 0,
  } = options;

  const obj = { value: 0 };

  gsap.to(obj, {
    value: target,
    duration,
    ease: "power2.out",
    onUpdate: () => {
      const el = document.querySelector(selector);
      if (el) {
        el.textContent =
          prefix + obj.value.toFixed(decimals) + suffix;
      }
    },
    scrollTrigger: {
      trigger: selector,
      start: "top bottom-=10%",
      toggleActions: "play none none none",
    },
  });
}

// ── Magnetic hover effect ───────────────────────────────────────────

export function initMagnetic(selector: string, strength = 0.3) {
  if (prefersReducedMotion()) return;

  document.querySelectorAll(selector).forEach((el) => {
    el.addEventListener("mousemove", (e: MouseEvent) => {
      const rect = el.getBoundingClientRect();
      const x = e.clientX - rect.left - rect.width / 2;
      const y = e.clientY - rect.top - rect.height / 2;
      gsap.to(el, {
        x: x * strength,
        y: y * strength,
        duration: 0.3,
        ease: "power2.out",
      });
    });

    el.addEventListener("mouseleave", () => {
      gsap.to(el, { x: 0, y: 0, duration: 0.5, ease: "elastic.out(1, 0.5)" });
    });
  });
}

// ── Parallax for elements ───────────────────────────────────────────

export function initParallax(selector: string, yRatio = 0.15) {
  if (prefersReducedMotion()) return;

  const elements = document.querySelectorAll(selector);
  elements.forEach((el) => {
    gsap.to(el as Element, {
      y: `-=${window.innerHeight * yRatio}`,
      ease: "none",
      scrollTrigger: {
        trigger: el,
        start: "top bottom",
        end: "bottom top",
        scrub: true,
      },
    });
  });
}

// ── Section label pin ───────────────────────────────────────────────

export function pinSectionLabel(selector: string) {
  if (prefersReducedMotion()) return;

  const labels = document.querySelectorAll(selector);
  labels.forEach((label) => {
    const section = (label as HTMLElement).closest("section") || (label as HTMLElement).parentElement;
    ScrollTrigger.create({
      trigger: section,
      start: "top center+=80",
      end: "bottom center-=80",
      pin: label,
      pinSpacing: false,
    });
  });
}

// ── Cleanup (SSR / navigation) ──────────────────────────────────────

export function cleanup() {
  ScrollTrigger.getAll().forEach((st) => st.kill());
  if (lenis) {
    lenis.destroy();
    lenis = null;
  }
  gsap.ticker.remove(ScrollTrigger.update);
}
