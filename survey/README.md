# Description
[survey.csv](survey.csv) contains the labels we assigned on 1057 papers from the security and web measurements conferences from 2010 to 2022.

- `conf` -- conference code
- `year` -- publication year
- `title` -- title of the paper
- `doi` -- DOI reference if available
- `in_scope` -- *yes*, if paper employs automated crawling, *no* otherwise
- `out of scope comment`
- `pagesim` -- page similarity algorithm
- `nav` -- navigation algorithm
- `depth` -- navigation algorithm depth
- `limit` -- page exploration limit
- `pageload` -- time spent waiting for page to load
- `objective` -- paper objective
- `needs navigation` -- *yes*, if paper could benefit from using navigation, *no* otherwise
- `topic` -- paper topics
- `nonav reason` -- authors' comment on not using navigation
