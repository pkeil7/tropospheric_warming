# Code Repository for the Tropospheric Warming Paper

Short documentation on how to use the scripts that produce Figures for the article "Tropical Tropospheric Warming Pattern Explained by Shifts in Convective Heating in the Matsuno-Gill Model".

- Link to paper: 
- Link to freely accessible preprint: 

Please be aware that the scripts were all designed to run on a high performance computer (in this case "levante" from the DKRZ) and therefore most of the scripts won't run out of the box on a laptop. The used data is large in size and processed with high memory usage. Some basic functions are stored in the `metcalc.py` and `aes_thermo.py` files, but the processing and visualising is mainly done in jupyter notebooks.

CMIP6 data is processed with the `get_cmip6_rcp85.ipynb` notebook. PJ simulations are processed with `interpolate_perpetual_jan.sh` and `perpet_jan_preproc.ipynb`. The forcing for the numerical Gill model is created with `prepare_forcing.ipynb`. Figures in the paper are created in `regional_warming.ipynb` (Figures 1 and 2), `precip_thermo_vs_dyn_seager.ipynb` (Figure 3), `compare_gill_PJ.ipynb` (Figures 4,5,6,8 and 11), `ADV_EMF.ipynb` (Figure 7), `compare_gill_cmip.ipynb` (Figures 9 and 10). The python environment is `python3/2023.01` on DKRZ's levante.

## ICON-A:

General Information on how to download and run the ICON model can be found here: https://mpimet.mpg.de/en/science/modeling and here: https://wiki.mpimet.mpg.de/doku.php?id=models:icon:start

## Numerical Gill Model

The numerical Gill model can be found here: https://github.com/pkeil7/numerical_gill
