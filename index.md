---
layout: default
title: Mathematics with Mr. Merrick
show_header: False 
---

{% raw %}
<style>
  :root {
    --purple: #52357B;
    --indigo: #5459AC;
    --blue: #648DB3;
    --mint: #B2D8CE;
    --text-dark: #222;
    --text-muted: #555;
    --link: #5459AC;
    --link-hover: #52357B;
  }

  body {
    margin: 0;
    font-family: system-ui, sans-serif;
    background-color: #fff;
    color: var(--text-dark);
    line-height: 1.6;
  }

  /* Gradient Header */
  .page-header {
    background: linear-gradient(135deg, var(--blue), var(--indigo), var(--purple));
    color: white;
    text-align: center;
    padding: 1.2rem 0; /* minimal padding */
  }

  .page-header h1 {
    margin: 0;
    font-size: 2rem;
    font-weight: 700;
  }

  /* Main content area */
  .container {
    max-width: 1000px;
    margin: 1.5rem auto;
    padding: 0 1rem;
  }

  h2 {
    color: var(--indigo);
    border-bottom: 2px solid var(--mint);
    padding-bottom: 0.3rem;
  }

  a {
    color: var(--link);
    text-decoration: none;
  }
  a:hover {
    color: var(--link-hover);
    text-decoration: underline;
  }

  ul {
    padding-left: 1.2rem;
  }

  footer {
    text-align: center;
    padding: 1rem;
    color: var(--text-muted);
    border-top: 1px solid #ddd;
    margin-top: 2rem;
  }

  /* Layout columns for sections */
  .row {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
  }
  .column {
    flex: 1;
    min-width: 250px;
  }
</style>

<div class="page-header">
  <h1>Mathematics with Mr. Merrick</h1>
</div>

<div class="container">
  <div class="row">
    <div class="column">
      <h2>Current Courses</h2>
      <ul>
        <li><a href="https://merrickmath.github.io/MerrickMath.github.io-APSTAT/">AP Statistics</a></li>
        <li><a href="https://merrickmath.github.io/Datascience/">Introduction to Data Science</a></li>
        <li><a href="https://merrickmath.github.io/MerrickMath.github.io-Div34Math">Math 10</a></li>
        <li><a href="https://merrickmath.github.io/MerrickMath.github.io-LinearAlgebra/">Linear Algebra</a></li>
      </ul>
    </div>
    <div class="column">
      <h2>Challenges</h2>
      <ul>
        <li><a href="https://MerrickMath.github.io/MerrickMath.github.io-PokemonChallenge/">Pokemon Challenge</a></li>
        <li><a href="https://merrickmath.github.io/Merrickmath.github.io-MasterChefCalc/">Master Chef Calculus</a></li>
        <li><a href="https://renertmath.github.io/RenertMath-CelebrateMath/">COL Challenge 2020</a></li>
        <li><a href="https://merrickmath.github.io/MerrickMath.github.io-PythonProject/">Python Project</a></li>
        <li><a href="https://merrickmath.github.io/MerrickMath.github.io-PumpkinBomb/">Pumpkin BOMB Challenge 2020</a></li>
        <li><a href="https://renertmath.github.io/RenertMath-PumpkinBomb2021/">Pumpkin BOMB Challenge 2021</a></li>
        <li><a href="https://merrickmath.github.io/MerrickMath-datachallenge/">DATA Challenge 2021</a></li>
      </ul>
    </div>
    <div class="column">
      <h2>Cool Stuff</h2>
      <ul>
        <li><a href="https://www.3blue1brown.com">3 Blue 1 Brown</a></li>
        <li><a href="https://krazydad.com/tablet/puzzles.php">Krazy Dad Interactive Puzzles</a></li>
        <li><a href="https://mathpickle.com">Math Pickle</a></li>
        <li><a href="https://www.mathplayground.com">Math Playground</a></li>
        <li><a href="https://www.cemc.uwaterloo.ca/contests/past_contests.html">CEMC Past Contests</a></li>
        <li><a href="https://artofproblemsolving.com/wiki/index.php/AMC_Problems_and_Solutions">AMC Problems and Solutions</a></li>
        <li><a href="https://mathkangaroo.ca/samples/en">Kangaroo Math Past Contests</a></li>
        <li><a href="https://www.datacamp.com">DataCamp</a></li>
      </ul>
    </div>
  </div>
</div>

<footer>
  <i>"Chase the extreme, not the mean"</i>
</footer>
{% endraw %}
