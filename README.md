# Projected Impact of Concurrently Available Long-Acting Injectable and Daily-Oral HIV PrEP

This repository holds the source to code to reproduce the analysis featured in our HIV transmission model among men who have sex with men in the United States. This study investigated how the availability of injectable PrEP could impact HIV incidence overall among MSM. We modeled PrEP uptake by varying the rate of PrEP initiation and proportion choosing injectable PrEP versus daily-oral PrEP.

## Citation

> Maloney KM, Le Guillou A, Driggers RA, Sarkar S, Anderson EJ, Malik AA, Jenness SM. Projected Impact of Concurrently Available Long-Acting Injectable and Daily-Oral HIV Pre-Exposure Prophylaxis: A Mathematical Model. _The Journal of Infectious Diseases._ 2021; 223(1): 72–82.

<img src="https://github.com/EpiModel/injectable-prep/blob/master/analysis/Fig1.png">

Additional details may be found in the journal article:

**Journal:** https://academic.oup.com/jid/article/223/1/72/5901097

## Abstract

**Background:** Long-acting injectable HIV pre-exposure prophylaxis (LAI-PrEP) is reportedly efficacious, although full trial results have not been published. We used a dynamic network model of HIV transmission among men who have sex with men (MSM) to assess the population impact of LAI-PrEP when available concurrently with daily-oral (DO) PrEP.

**Methods:** The reference model represents the current HIV epidemiology and DO-PrEP coverage (15% among indicated) among MSM in the southeastern US. Primary analyses investigated varied PrEP uptake and proportion selecting LAI-PrEP. Secondary analyses evaluated uncertainty in pharmacokinetic efficacy and LAI-PrEP persistence relative to DO-PrEP.

**Results:** Compared to the reference scenario, if 50% chose LAI-PrEP, 4.3% (95% SI: -7.3%, 14.5%) of infections would be averted over 10 years. LAI-PrEP impact is slightly greater than the DO-PrEP only regimen based on assumptions of higher adherence and partial protection after discontinuation. If the total PrEP initiation rate doubled, 17.1% (95% SI: 6.7%, 26.4%) of infections would be averted. The highest population-level impact occurred when LAI-PrEP uptake and persistence improved.

**Conclusions:** If LAI-PrEP replaces DO-PrEP, its availability will modestly improve the population impact. LAI-PrEP will make a more substantial impact if its availability drives higher total PrEP coverage, or if persistence is greater for LAI-PrEP.

## Model Code

These models are written and executed in the R statistical software language. To run these files, it is necessary to first install our epidemic modeling software, [EpiModel](http://epimodel.org/), and our extension package specifically for modeling HIV and STI transmission dynamics among MSM, [EpiModelHIV](http://github.com/statnet/EpiModelHIV).

This is accomplished with the `renv` package in R. First install `renv` (if you do not already have it installed) and run:


```r
renv::init()
```


in your project directory. Select the option to restore the package set from the "renv.lock" file. Currently, this requires access to the `ARTnetData` package, which requires a limited access data use agreement due to the sensitive nature of those study data. Please contact the corresponding author for access.
