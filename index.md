---
layout: default
title: Mathematics with Mr. Merrick
show_header: false
---

{% raw %}
<!-- LaTeX-ish serif -->
<link href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:wght@400;600;700&display=swap" rel="stylesheet">

<style>
  :root{
    --bg:#ffffff;
    --surface:#ffffff;
    --surface-alt:#f4f6ff;
    --text:#0f172a;
    --muted:#475569;
    --indigo:#5459AC;
    --purple:#52357B;
    --ring:rgba(84,89,172,.28);
    --shadow:0 10px 25px rgba(2,6,23,.08);
    --radius:18px;
  }

  body,.page-header,.main-content,header,footer{
    background:var(--bg) !important;
    border:0 !important;
  }

  body{
    margin:0;
    -webkit-font-smoothing:antialiased; 
    -moz-osx-font-smoothing:grayscale;
    font-family:"STIX Two Text","Computer Modern Serif","Latin Modern Roman","Times New Roman",serif;
    color:var(--text);
    line-height:1.6;
  }

  .banner{
    width:100%;
    background:linear-gradient(135deg,#648DB3,#5459AC,#52357B);
    color:#fff;
    padding:12px 10px;
  }
  .banner__inner{
    max-width:1100px; margin:0 auto;
    display:flex; align-items:center; justify-content:center;
  }
  .banner__title{
    margin:0;
    font-weight:800;
    font-size:clamp(22px,3vw,36px);
    letter-spacing:.2px;
    text-align:center;
  }

  .container{ max-width:1100px; margin:14px auto 56px; padding:0 20px; }

  header{ display:grid; gap:8px; justify-items:center; text-align:center; margin:8px 0 20px; }
  header .quote{ font-size:.98rem; color:var(--muted); max-width:70ch; margin:0; }

  .grid{ display:grid; grid-template-columns:repeat(12,1fr); gap:16px; }
  section{
    grid-column:span 12;
    background:var(--surface);
    border:1px solid #e5e7eb;
    border-radius:var(--radius);
    box-shadow:var(--shadow);
    padding:18px 18px 10px;
  }
  @media (min-width:860px){ section{ grid-column:span 4; } }

  /* Bigger section headings */
  section h2{
    margin:2px 2px 12px;
    font-size:clamp(1.25rem,2.2vw,1.6rem);
    font-weight:800; letter-spacing:.2px;
    color:var(--purple);
    border-bottom:2px solid #e8eafc; padding-bottom:.2rem;
  }

  ul.linklist{ list-style:none; padding:0; margin:0; display:grid; gap:8px; }
  .linkitem a{
    display:flex; align-items:center; justify-content:space-between;
    gap:10px; text-decoration:none;
    color:var(--indigo);
    background:var(--surface-alt);
    padding:10px 12px; border-radius:12px; border:1px solid var(--ring);
    transition:transform .12s ease, box-shadow .12s ease, border-color .12s ease, background .12s ease;
    outline-offset:3px; font-weight:600;
  }
  .linkitem a:hover,.linkitem a:focus{
    transform:translateY(-1px);
    box-shadow:0 10px 18px rgba(2,6,23,.10);
    border-color:var(--indigo);
    background:#e9ecff;
  }

  .badge{
    display:inline-block; font-size:.72rem; letter-spacing:.15px; line-height:1;
    padding:6px 8px; border-radius:999px; background:#eef1fb; color:var(--purple); border:1px solid var(--ring);
  }
  .badge.active{ background:#ede8ff; color:var(--purple); }

  footer{ margin-top:28px; text-align:center; color:var(--muted); font-size:.9rem; }

  /* Title + icon */
  .title-wrap{ text-align:center; margin:12px 0 10px; }
  .title-logo{ display:block; width:84px; height:auto; margin:0 auto 8px; color:var(--indigo); }
  .page-title{
    margin:0;
    font-weight:800;
    text-align:center;
    font-size:clamp(28px,4vw,44px);
    color:var(--indigo);
  }
</style>

<!-- Title with inline SVG icon -->
<div class="title-wrap">
  <svg class="title-logo" viewBox="0 0 128 64" role="img" aria-label="Normal distribution">
    <path d="M4 56 C 24 56, 40 8, 64 8 C 88 8, 104 56, 124 56" 
          fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round"/>
  </svg>
  <h1 class="page-title">Mathematics with Mr. Merrick</h1>
</div>

<div class="container">
  <header>
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
        <li class="linkitem"><a href="https://MerrickMath.github.io/MerrickMath.github.io-PokemonChallenge/" data-ext="true"><span>Pokemon Challenge</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/Merrickmath.github.io-MasterChefCalc/" data-ext="true"><span>Master Chef Calculus</span></a></li>
        <li class="linkitem"><a href="https://renertmath.github.io/RenertMath-CelebrateMath/" data-ext="true"><span>COL Challenge 2020</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath.github.io-PythonProject/" data-ext="true"><span>Python Project</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath.github.io-PumpkinBomb/" data-ext="true"><span>Pumpkin BOMB Challenge 2020</span></a></li>
        <li class="linkitem"><a href="https://renertmath.github.io/RenertMath-PumpkinBomb2021/" data-ext="true"><span>Pumpkin BOMB Challenge 2021</span></a></li>
        <li class="linkitem"><a href="https://merrickmath.github.io/MerrickMath-datachallenge/" data-ext="true"><span>DATA Challenge 2021</span></a></li>
      </ul>
    </section>
    <!-- Cool Stuff -->
    <section aria-labelledby="sec-cool">
      <h2 id="sec-cool">Cool Stuff</h2>
      <ul class="linklist">
        <li class="linkitem"><a href="https://www.3blue1brown.com" target="_blank" rel="noopener"><span>3 Blue 1 Brown</span></a></li>
        <li class="linkitem"><a href="https://krazydad.com/tablet/puzzles.php" target="_blank" rel="noopener"><span>Krazy Dad Interactive Puzzles</span></a></li>
        <li class="linkitem"><a href="https://mathpickle.com" target="_blank" rel="noopener"><span>Math Pickle</span></a></li>
        <li class="linkitem"><a href="https://www.mathplayground.com" target="_blank" rel="noopener"><span>Math Playground</span></a></li>
        <li class="linkitem"><a href="https://www.cemc.uwaterloo.ca/contests/past_contests.html" target="_blank" rel="noopener"><span>CEMC Past Contests</span></a></li>
        <li class="linkitem"><a href="https://artofproblemsolving.com/wiki/index.php/AMC_Problems_and_Solutions" target="_blank" rel="noopener"><span>AMC Problems and Solutions</span></a></li>
        <li class="linkitem"><a href="https://mathkangaroo.ca/samples/en" target="_blank" rel="noopener"><span>Kangaroo Math Past Contests</span></a></li>
        <li class="linkitem"><a href="https://www.datacamp.com" target="_blank" rel="noopener"><span>DataCamp</span></a></li>
      </ul>
    </section>
  </main>

  <footer></footer>
</div>
{% endraw %}
