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
.title-wrap {
  text-align: center;
  margin: 10px 0 10px;
}
.title-logo {
  display: block;
  width: 400px;       /* was ~92px — now larger */
  height: auto;
  margin: 0 auto -6px; /* was 2px — slight extra breathing space, still tight */
}
.page-title {
  margin: 0;
  font-weight: 800;
  text-align: center;
  font-size: clamp(28px, 4vw, 44px);
  color: var(--indigo);
}
</style>

<!-- Title with Wikimedia Gaussian SVG right on top -->
<div class="title-wrap">
  <svg class="title-logo" version="1.1" xmlns="http://www.w3.org/2000/svg" width="210" height="100" viewBox="0 0 210 100" role="img" aria-label="Gaussian distribution">
    <title>Gaussian distribution</title>
    <polyline fill="#ED1C24" points="78.549,84.75 81.549,84.75 80.049,89.25 "/>
    <polyline fill="#ED1C24" points="128.529,84.75 131.529,84.75 130.029,89.25 "/>
    <polyline fill="#39B54A" points="103.539,84.75 106.539,84.75 105.039,89.25 "/>
    <line fill="none" stroke="#000000" stroke-width="0.75" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="5" y1="82.482" x2="204.96" y2="82.482"/>
    <line fill="none" stroke="#ED1C24" stroke-width="0.75" stroke-linecap="round" x1="80.049" y1="35.037" x2="80.049" y2="85.587"/>
    <line fill="none" stroke="#ED1C24" stroke-width="0.75" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="130.029" y1="34.994" x2="130.029" y2="85.587"/>
    <line fill="none" stroke="#39B54A" stroke-width="0.75" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="105.039" y1="4.189" x2="105.039" y2="85.587"/>
    <path fill="none" stroke="#0071BC" stroke-width="0.75" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="M5.078,82.456c4.511-0.019,9.021-0.058,13.53-0.175c4.312-0.113,8.639-0.297,12.923-0.836c4.536-0.572,8.991-1.522,13.261-3.25c4.255-1.723,8.016-4.334,11.491-7.389c3.378-2.968,6.334-6.613,8.934-10.324c2.676-3.817,5.156-7.777,7.458-11.854c2.372-4.2,4.644-8.458,6.896-12.729c2.208-4.187,4.419-8.368,6.715-12.502c2.244-4.042,4.669-8.055,7.508-11.674c1.471-1.875,3.092-3.546,4.906-5.054c1.765-1.467,3.896-2.293,6.126-2.468c2.262-0.177,4.408,0.98,6.232,2.234c1.866,1.283,3.42,3.086,4.861,4.844c2.973,3.619,5.365,7.744,7.704,11.822c2.267,3.953,4.362,8.014,6.489,12.049c2.24,4.25,4.479,8.502,6.841,12.682c2.29,4.056,4.69,8.058,7.354,11.858c2.731,3.898,5.724,7.564,9.159,10.809c3.378,3.188,7.235,5.673,11.417,7.527c4.024,1.785,8.44,2.759,12.768,3.305c4.449,0.563,8.912,0.803,13.39,0.938c4.426,0.135,8.856,0.164,13.284,0.185c0.227,0,0.449,0.002,0.674,0.003"/>
    <path fill="#39B54A" d="M105.691,93.879c-0.131,0.248-0.438,0.549-0.907,0.549c-0.286,0-0.553-0.105-0.689-0.347v0.384c0,0.354,0.013,0.934,0.071,1.193h-0.516c-0.064-0.195-0.091-0.658-0.091-1.167v-3.279h0.573v1.864c0,0.488,0.202,0.895,0.711,0.895c0.378,0,0.646-0.269,0.75-0.529c0.033-0.084,0.052-0.188,0.052-0.299v-1.931h0.573v2.289c0,0.345,0.066,0.481,0.302,0.495l-0.047,0.417c-0.072,0.021-0.104,0.026-0.201,0.026c-0.281,0-0.508-0.157-0.562-0.562L105.691,93.879L105.691,93.879z"/>
    <path fill="#ED1C24" d="M126.887,94.035c-0.131,0.248-0.438,0.548-0.906,0.548c-0.287,0-0.556-0.104-0.69-0.347v0.386c0,0.353,0.013,0.933,0.071,1.192h-0.516c-0.064-0.195-0.092-0.658-0.092-1.168v-3.277h0.573v1.863c0,0.488,0.202,0.895,0.711,0.895c0.378,0,0.646-0.268,0.75-0.527c0.032-0.086,0.053-0.189,0.053-0.301v-1.93h0.573v2.288c0,0.346,0.064,0.481,0.3,0.495l-0.046,0.416c-0.07,0.021-0.104,0.027-0.202,0.027c-0.28,0-0.508-0.156-0.562-0.562L126.887,94.035L126.887,94.035z"/>
    <path fill="#ED1C24" d="M130.036,91.057v1.531h1.474v0.391h-1.474v1.547h-0.417v-1.547h-1.475v-0.391h1.475v-1.531H130.036z"/>
    <path fill="#ED1C24" d="M134.459,91.734c0.371,0.261,0.586,0.717,0.586,1.191c0,1.16-0.795,1.67-1.512,1.67c-0.848,0-1.514-0.619-1.514-1.617c0-1.057,0.672-1.676,1.623-1.676c0.176,0,0.516,0,0.606,0h0.347c0.215,0,0.592,0.006,0.709-0.007l-0.019,0.438c-0.149,0-0.365,0-0.828-0.021L134.459,91.734L134.459,91.734z M134.479,92.928c0-0.529-0.273-1.193-0.926-1.193s-0.945,0.627-0.945,1.22c0,0.69,0.397,1.213,0.945,1.213C134.066,94.166,134.479,93.645,134.479,92.928z"/>
    <path fill="#ED1C24" d="M76.905,93.914c-0.131,0.249-0.438,0.548-0.907,0.548c-0.286,0-0.554-0.104-0.69-0.345v0.384c0,0.353,0.013,0.933,0.072,1.192h-0.516c-0.065-0.195-0.091-0.658-0.091-1.168v-3.277h0.573v1.863c0,0.488,0.202,0.895,0.711,0.895c0.378,0,0.646-0.268,0.749-0.527c0.033-0.086,0.053-0.188,0.053-0.301v-1.93h0.573v2.288c0,0.347,0.065,0.481,0.3,0.496l-0.046,0.417c-0.071,0.02-0.104,0.025-0.201,0.025c-0.281,0-0.509-0.156-0.562-0.562L76.905,93.914L76.905,93.914z"/>
    <path fill="#ED1C24" d="M81.528,92.467v0.391h-3.363v-0.391H81.528z"/>
    <path fill="#ED1C24" d="M84.478,91.613c0.372,0.261,0.587,0.717,0.587,1.191c0,1.16-0.796,1.67-1.513,1.67c-0.848,0-1.512-0.619-1.512-1.617c0-1.055,0.671-1.676,1.623-1.676c0.176,0,0.515,0,0.605,0h0.346c0.215,0,0.593,0.008,0.711-0.007l-0.02,0.438c-0.15,0-0.365,0-0.828-0.02L84.478,91.613L84.478,91.613z M84.497,92.807c0-0.527-0.273-1.193-0.926-1.193c-0.651,0-0.945,0.627-0.945,1.22c0,0.69,0.397,1.213,0.945,1.213C84.086,94.045,84.497,93.523,84.497,92.807z"/>
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

<script>
  (function () {
    const nav = performance.getEntriesByType('navigation')[0];
    const isReload =
      nav && (nav.type === 'reload' || nav.type === 'back_forward');

    // If there is no URL fragment (e.g., #sec-courses), ensure top on load/reload
    if (!location.hash) {
      // Run on load
      window.addEventListener('load', function () {
        window.scrollTo(0, 0);
      });

      // Also handle bfcache restores (Safari/Firefox back-forward cache)
      window.addEventListener('pageshow', function (e) {
        if (e.persisted || isReload) {
          window.scrollTo(0, 0);
        }
      });
    }
  })();
</script>


{% endraw %}
