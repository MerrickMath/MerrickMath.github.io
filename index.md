---
layout: default
title: Student Learning Hub
show_header: false
---

{% raw %}
<style>
  :root {
    --bg: #0f172a;          /* slate-900 */
    --card: #111827;        /* gray-900 */
    --card-alt: #0b1224;    /* slightly darker */
    --text: #e5e7eb;        /* gray-200 */
    --muted: #94a3b8;       /* slate-400 */
    --accent: #60a5fa;      /* blue-400 */
    --accent-2: #a78bfa;    /* violet-400 */
    --ring: rgba(96,165,250,.45);
    --shadow: 0 10px 25px rgba(0,0,0,.35);
    --radius: 18px;
  }

  @media (prefers-color-scheme: light) {
    :root {
      --bg: #f8fafc;        /* slate-50 */
      --card: #ffffff;       /* white */
      --card-alt: #f1f5f9;   /* slate-100 */
      --text: #0f172a;       /* slate-900 */
      --muted: #475569;      /* slate-600 */
      --accent: #2563eb;     /* blue-600 */
      --accent-2: #7c3aed;   /* violet-700 */
      --ring: rgba(37,99,235,.25);
      --shadow: 0 10px 25px rgba(2,6,23,.08);
    }
  }

  * { box-sizing: border-box; }
  html, body { height: 100%; }
  body {
    margin: 0;
    font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
    background: radial-gradient(1200px 600px at 10% -10%, rgba(99,102,241,.20), transparent 50%),
                radial-gradient(1000px 500px at 110% 10%, rgba(96,165,250,.18), transparent 50%),
                var(--bg);
    color: var(--text);
    line-height: 1.55;
  }

  .container { max-width: 1100px; margin: 0 auto; padding: 32px 20px 56px; }

  header { display: grid; gap: 8px; justify-items: center; text-align: center; margin-bottom: 24px; }
  header h1 { font-size: clamp(26px, 3.2vw, 36px); margin: 0; letter-spacing: .2px; }
  header .quote { font-size: 0.98rem; color: var(--muted); max-width: 70ch; margin: 0; opacity: .9; }

  /* Skip link */
  .skip-link { position: absolute; left: -999px; top: auto; width: 1px; height: 1px; overflow: hidden; }
  .skip-link:focus {
    left: 16px; top: 16px; width: auto; height: auto; padding: 8px 12px; border-radius: 10px; background: var(--card);
    outline: 2px solid var(--accent); color: var(--text);
  }

  /* Section grid */
  .grid { display: grid; grid-template-columns: repeat(12, 1fr); gap: 16px; }
  section {
    grid-column: span 12;
    background: linear-gradient(180deg, var(--card), var(--card-alt));
    border: 1px solid rgba(148,163,184,.15);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    padding: 18px 18px 8px;
    outline: 1px solid rgba(255,255,255,.02);
  }
  @media (min-width: 860px) { section { grid-column: span 4; } }
  section h2 { margin: 2px 2px 12px; font-size: 1.1rem; font-weight: 700; letter-spacing: .2px; }

  /* Link list */
  ul.linklist { list-style: none; padding: 0; margin: 0; display: grid; gap: 8px; }
  .linkitem { display: flex; align-items: center; gap: 10px; }
  .linkitem a {
    flex: 1; display: inline-flex; align-items: center; justify-content: space-between;
    text-decoration: none; color: var(--text); background: rgba(148,163,184,.10);
    padding: 10px 12px; border-radius: 12px; border: 1px solid rgba(148,163,184,.18);
    transition: transform .12s ease, box-shadow .12s ease, border-color .12s ease, background .12s ease;
    outline-offset: 3px;
  }
  .linkitem a:hover, .linkitem a:focus {
    transform: translateY(-1px);
    box-shadow: 0 10px 18px rgba(2,6,23,.20);
    border-color: var(--accent);
    background: rgba(96,165,250,.08);
  }
  .linkitem a[target="_blank"]::after, .linkitem a[data-ext="true"]::after { content: "↗"; font-size: .95em; opacity: .6; margin-left: 10px; }

  /* Badges */
  .badge { display: inline-block; font-size: .72rem; letter-spacing: .15px; line-height: 1; padding: 6px 8px;
           border-radius: 999px; background: rgba(99,102,241,.15); color: var(--text); border: 1px solid rgba(99,102,241,.35); }
  .badge.active { background: rgba(96,165,250,.18); border-color: rgba(96,165,250,.45); }

  footer { margin-top: 28px; text-align: center; color: var(--muted); font-size: .9rem; }

  /* Page hero image placed in page (not layout) */
  .hero-img { display:block; width: 160px; max-width: 40vw; height: auto; border-radius: 16px; box-shadow: 0 6px 20px rgba(0,0,0,.35); margin: 4px auto 12px; }
</style>

<a class="skip-link" href="#main">Skip to content</a>
<div class="container">
  <header>
    <img class="hero-img" src="https://merrickmath.github.io/maintop.png" alt="Mathematics with Mr. Merrick">
    <h1>Learning Repository</h1>
    <p class="quote"><em>“The enchanting charms of this sublime science reveal only to those who have the courage to go deeply into it.”</em> — Carl Friedrich Gauss</p>
  </header>

  <main id="main" class="grid" aria-label="Main sections">
    <!-- Current Courses -->
    <section aria-labelledby="sec-courses">
      <h2 id="sec-courses">Current Courses</h2>
      <ul class="linklist">
        <li class="linkitem">
          <a href="https://merrickmath.github.io/MerrickMath.github.io-APSTAT/" data-ext="true" aria-label="AP Statistics">
            <span>AP Statistics</span>
            <span class="badge active" aria-hidden="true">Active</span>
          </a>
        </li>
        <li class="linkitem">
          <a href="https://merrickmath.github.io/Datascience/" data-ext="true" aria-label="Introduction to Data Science">
            <span>Introduction to Data Science</span>
            <span class="badge">Course</span>
          </a>
        </li>
        <li class="linkitem">
          <a href="https://merrickmath.github.io/MerrickMath.github.io-Div34Math" data-ext="true" aria-label="Math 10">
            <span>Math 10</span>
            <span class="badge">Course</span>
          </a>
        </li>
        <li class="linkitem">
          <a href="https://merrickmath.github.io/MerrickMath.github.io-LinearAlgebra/" data-ext="true" aria-label="Linear Algebra">
            <span>Linear Algebra</span>
            <span class="badge">Elective</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- Challenges -->
    <section aria-labelledby="sec-challenges">
      <h2 id="sec-challenges">Challenges</h2>
      <ul class="linklist">
        <li class="linkitem"><a href="https://MerrickMath.github.io/MerrickMath.github.io-PokemonChallenge/" data-ext="true" aria-label="Pokemon Challenge"><span>Pokemon Challenge</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/Merrickmath.github.io-MasterChefCalc/" data-ext="true" aria-label="Master Chef Calculus"><span>Master Chef Calculus</span></a></li>
        <li class="linkitem"><a href="https://renertmath.github.io/RenertMath-CelebrateMath/" data-ext="true" aria-label="COL Challenge 2020"><span>COL Challenge 2020</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath.github.io-PythonProject/" data-ext="true" aria-label="Python Project"><span>Python Project</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath.github.io-PumpkinBomb/" data-ext="true" aria-label="Pumpkin Bomb Challenge 2020"><span>Pumpkin BOMB Challenge 2020</span></a></li>
        <li class="linkitem"><a href="https://renertmath.github.io/RenertMath-PumpkinBomb2021/" data-ext="true" aria-label="Pumpkin Bomb Challenge 2021"><span>Pumpkin BOMB Challenge 2021</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath-datachallenge/" data-ext="true" aria-label="Data Challenge 2021"><span>DATA Challenge 2021</span></a></li>
      </ul>
    </section>
    <!-- Cool Stuff -->
    <section aria-labelledby="sec-cool">
      <h2 id="sec-cool">Cool Stuff</h2>
      <ul class="linklist">
        <li class="linkitem"><a href="https://www.3blue1brown.com" target="_blank" rel="noopener" aria-label="3 Blue 1 Brown"><span>3 Blue 1 Brown</span></a></li>
        <li class="linkitem"><a href="https://krazydad.com/tablet/puzzles.php" target="_blank" rel="noopener" aria-label="Krazy Dad Interactive Puzzles"><span>Krazy Dad Interactive Puzzles</span></a></li>
        <li class="linkitem"><a href="https://mathpickle.com" target="_blank" rel="noopener" aria-label="Math Pickle"><span>Math Pickle</span></a></li>
        <li class="linkitem"><a href="https://www.mathplayground.com" target="_blank" rel="noopener" aria-label="Math Playground"><span>Math Playground</span></a></li>
        <li class="linkitem"><a href="https://www.cemc.uwaterloo.ca/contests/past_contests.html" target="_blank" rel="noopener" aria-label="CEMC Past Contests"><span>CEMC Past Contests</span></a></li>
        <li class="linkitem"><a href="https://artofproblemsolving.com/wiki/index.php/AMC_Problems_and_Solutions" target="_blank" rel="noopener" aria-label="AMC Problems and Solutions"><span>AMC Problems and Solutions</span></a></li>
        <li class="linkitem"><a href="https://mathkangaroo.ca/samples/en" target="_blank" rel="noopener" aria-label="Kangaroo Math Past Contests"><span>Kangaroo Math Past Contests</span></a></li>
        <li class="linkitem"><a href="https://www.datacamp.com" target="_blank" rel="noopener" aria-label="DataCamp"><span>DataCamp</span></a></li>
      </ul>
    </section>
  </main>

  <footer></footer>
</div>
{% endraw %}
