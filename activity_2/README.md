## Overview 
The goal of today’s hands-on activity is to allow you to explore Bayesian models. You are provided with a range of examples from which you can choose, based on your comfort level, experience, and interest. Work in groups to discuss the problem, program the model in R/JAGS, and troubleshoot issues that arise. Below are 6 example problems (A-F) that you can choose from. 

### Example Problems
These are approximately ordered from simple to more challenging:

* Pumps. Involves a Poisson likelihood for count data representing the number of failures recorded for individual power-plant pumps. Similar to the tree mortality example in lecture. Gain experience implementing and comparing non-hierarchical versus hierarchical Bayesian models. For beginners with little R, Bayesian, or programming experience.

* Seeds. This is somewhat similar to Moths (below), but you simply work through the example (code, model) provided in the OpenBUGS example from which this problem is taken. A logistic regression (for number of seed that germinated) is conducted to determine if probability of germination differs among seed types (species) and growth media. The model includes an over-dispersion (random effect) term. For beginners with little R, Bayesian, or programming experience.

* Moths. Involves a logistic regression with a site random effect. Data are counts (number of moths removed by predators), and the probability of removal is modeled as a function of distance from the city. Different morphs (light vs dark colored moths) are expected to differ in how predation probability varies with distance. Addition of a site random effect can create an identifiability problem.

* SLA. Involves a series of meta-analysis models (simple to more complex) for specific leaf area (SLA) “data” obtained for the literature. The data are for 25 pine species occurring in the U.S., and the goal is to obtain standardized, 1-sided (projected) SLA for all species. Modifications to model involve accounting for sidedness (50% of data are missing), incorporating taxonomic relationships, and accounting for “data” uncertainty via reported (and missing) standard error and sample size information.

* Stomata. This involves a multiple regression analysis to quantify the environmental factors that affect maximum daily stomatal conductance in a desert shrub. Involves covariate centering and computing derived quantities such as the optimal temperature. Some calculus skills are required. Starter code is provided.

* Roots. The goal is to estimate root density profiles for different deserts and/or vegetation types. Soil samples collected at 5 cm increments were measured for root biomass, but the small sample resulted in many zeros (no roots). Thus, root biomass is modeled in addition to detection errors, to account for the zero-inflated problem. Parameters may be modeled hierarchically by desert or vegetation type.

* Jackalopes. 

### Activities
1. Draw a DAG for your problem/model.
2. Develop/write the JAGS code; some examples are provided with complete code, others with starter code.
3. Start with the R script and model files provide for each project, and modify the R script based on the R script file from the Day 1 Activity (for creating data, communicating with JAGS, running the JAGS model, and evaluating the MCMC output).
4. In general, you will run your models following the steps outlined in Activity 1.
5. Evaluate MCMC behavior, compute posterior statistics, and discuss results.
6. Work though the specific activities suggested for the particular example that you have chosen.
