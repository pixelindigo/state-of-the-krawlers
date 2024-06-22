# State of the Krawlers experiments data

This repository contains the data used in experiments for [SoK: State of the Krawlers – Evaluating the Effectiveness of Crawling Algorithms for Web Security Measurements](https://www.usenix.org/conference/usenixsecurity24/presentation/stafeev)

## Survey

[survey/](survey/) contains the labels we assigned on 1057 papers from the security and web measurements conferences from 2010 to 2022.


## Arachnarium modules
[crawlers/](crawlers/) contains the [Arachnarium](https://github.com/pixelindigo/arachnarium/tree/sec24) crawler modules used in the paper.

[apps/](apps/) contains the [Arachnarium](https://github.com/pixelindigo/arachnarium/tree/sec24) app modules used in the paper.


Example usage (assuming Arachnarium is installed on the system):

`arachnarium run crawlers/crawljax apps/hotcrp -t 5 -a url_full --nav bfs --app hotcrp --no-save-screenshots --url https://web/index.php`

Or run a few at once `arachnarium batch -w 4 arachnarium_examples/tools.yml`

Then check `experiments/` directory to see the generated data -- each experiment would be at `/<app>/<crawler>/<id>/` and contain the following dir structure:
- `coverage/` -- code coverage files collected
- `report/` -- crawler's report files
- `command.txt` -- crawler command line arguments
- `runtime.txt` -- time spent on an experiment
- `stderr.txt` -- stderr output
- `stdout.txt` -- stdout output

## Experiment data

[Experiment data](https://github.com/pixelindigo/state-of-the-krawlers/releases/tag/sec24) contains the data collected for code coverage, link coverage, and JS file coverage:

- [itw.txz](https://github.com/pixelindigo/state-of-the-krawlers/releases/download/sec24/itw.txz) contains the link and js file coverage files (Uncompressed 639.7 MiB).

- [code_coverage.txz](https://github.com/pixelindigo/state-of-the-krawlers/releases/download/sec24/code_coverage.txz) contains the code coverage files (Uncompressed 43.8 GiB).

You can also find the corresponding `README.md` files in each archive.
