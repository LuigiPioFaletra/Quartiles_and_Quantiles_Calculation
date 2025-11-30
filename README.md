# MATLAB Project - Quartiles and Quantiles Calculation

## Overview

This repository contains a MATLAB project for **calculation of quartiles, quantiles, and dispersion indices**.  
The program is designed to analyze numerical data, either raw or grouped in classes, and compute statistical measures such as quartiles, quantiles, variance, standard deviation, kurtosis, and the fourth empirical moment.  
The project was developed as part of coursework in **Advanced Programming / Numerical Methods**.

The project implements:
- Calculation of quartiles and quantiles for datasets  
- Grouping of continuous or discrete data into classes  
- Computation of dispersion indices: variance, standard deviation, kurtosis, and interquartile range  
- Automated and manual table construction for data collection  
- Support for pre-defined datasets (`.tsv` files)  
- Visualization of computed results

---

## Repository Structure

```
main_repository/
│
├── dataset/
│ ├── Automobili.tsv
│ ├── Cellulari.tsv
│ ├── Laptop.tsv
│ ├── Libri.tsv
│ └── Stati mondiali.tsv
│
├── implementation/
│ ├── calcolo_indici_di_asimmetria.m
│ ├── calcolo_quartili.m
│ ├── calcolo_quantili.m
│ ├── costruzione_tabella_con_intervalli.m
│ ├── costruzione_tabella_con_valori.m
│ ├── dati_input.m
│ ├── main_quartili_e_quantili.m
│ ├── procedura_intervalli_con_e_senza_dataset.m
│ ├── procedura_valori_con_e_senza_dataset.m
│ ├── scelta_dataset.m
│ ├── suddivisione_con_dataset.m
│ └── suddivisione_senza_dataset.m
│
├── description.pdf
├── LICENSE
└── README.md
```

---

## Introduction

The MATLAB program implements the computation of **quartiles** and **quantiles**, starting from basic concepts of median and extending to empirical distribution functions:

- **Median:** the value dividing the dataset into two equal halves.  
- **Quartiles:** the median of the dataset (Q2), the median of the lower half (Q1), and the median of the upper half (Q3).  
- **Quantile of order α ∈ [0,1]:** value qα such that at least 100*α% of observations lie to its left, and 100*(1-α)% lie to its right.  
- **Percentile:** a quantile expressed in percentage terms.  

For grouped data, classes are created either as intervals of equal width or as distinct values. The number of classes `k` can be approximated as `k ≈ [√n] + 1`, where `n` is the number of data points, and the class width `a` is given by `a = R/k`, with `R` being the range of the data.

---

## Examples

### Example 1: Continuous Data (Airborne Dust Concentration)

| Classes     | fi | pi  | Fi  |
|------------|----|-----|-----|
| [0, 0.5[  | 10 | 0.37| 0.37|
| [0.5, 1[  | 8  | 0.30| 0.67|
| [1, 1.5[  | 6  | 0.20| 0.87|
| [1.5, 2[  | 3  | 0.10| ≈1  |

Quartiles:

- Q1 = 0.34  
- Q2 = 0.72  
- Q3 = 1.2

### Example 2: Discrete Data (Student Scores)

| Voto | fi | pi  | Fi  |
|------|----|-----|-----|
| 5    | 1  | 0.05| 0.05|
| 6    | 5  | 0.25| 0.30|
| 7.5  | 6  | 0.30| 0.60|
| 8.5  | 3  | 0.15| 0.75|
| 9    | 4  | 0.20| 0.95|
| 10   | 1  | 0.05| 1   |

Quantiles:

- 80th percentile: q0.8 = 8.62  
- 90th percentile: q0.9 = 8.875

---

## MATLAB Implementation

The project contains 12 `.m` files and 5 `.tsv` datasets:

- **Main:** `main_quartili_e_quantili.m` – executes the program  
- **Support functions (11):**
  1. `calcolo_indici_di_asimmetria.m`
  2. `calcolo_quantili.m`
  3. `calcolo_quartili.m`
  4. `costruzione_tabella_con_intervalli.m`
  5. `costruzione_tabella_con_valori.m`
  6. `dati_input.m`
  7. `procedura_intervalli_con_e_senza_dataset.m`
  8. `procedura_valori_con_e_senza_dataset.m`
  9. `scelta_dataset.m`
  10. `suddivisione_con_dataset.m`
  11. `suddivisione_senza_dataset.m`

Each function handles specific tasks such as:

- Input validation and user interaction  
- Table construction for intervals or values  
- Calculation of quartiles and quantiles  
- Computation of asymmetry indices  

---

## Usage

1. Open MATLAB and navigate to the project folder.  
2. Run:
```matlab
main_quartili_e_quantili
```
3. Follow the prompts to input your data or select a dataset.
4. View the computed quartiles, quantiles, and asymmetry indices.
