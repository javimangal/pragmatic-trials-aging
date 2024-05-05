# Description

This repository contains the associated supplementary materials for the chapter entitled "Chapter 9 - Pragmatic Trials", which will be published as part of the 3rd edition of the book Aging Research - Methodological Issues. This will be a brand new chapter of the re-edition of the book. You can consult the [second edition here](https://link.springer.com/book/10.1007/978-3-319-95387-8).

## Usage

You will find the descriptions of the methods of the systematic literature search on the [docs](docs/) directory, as well as a report with the R version and package dependencies for the project. Figures and tables referenced in the chapter can be found in the [results](results/) file. The code for reproducibility of such outputs can be found in the [R folder](R/). The [PRECIS-2 script](R/PRECIS-2.R) can be used to generate a comparative PRECIS-2 figure of two hypothetical trials. 

## Project Structure

The project structure distinguishes three kinds of folders:

-   read-only (RO): not edited by either code or researcher

-   human-writable (HW): edited by the researcher only.

-   project-generated (PG): folders generated when running the code; these folders can be deleted or emptied and will be completely reconstituted as the project is run.

```         
.
├── .gitignore
├── CITATION.cff
├── LICENSE
├── README.md
├── data                  <- All project data
│   ├── processed         <- The final, canonical data sets. (PG)
│   ├── raw               <- The original, immutable data. (RO)
├── docs                  <- Documentation notebook for users (HW)
├── results
│   ├── output_figures    <- Figures for the manuscript or reports (PG)
│   └── output_tables     <- Other output for the manuscript or reports (PG)
└── R                     <- Source code for this project (HW)
```

## License

This project is licensed under the terms of the [MIT License](/LICENSE).

This project structure template repository is adapted from the [Good Enough Project](https://github.com/bvreede/good-enough-project) Cookiecutter template by Barbara Vreede (2019).
