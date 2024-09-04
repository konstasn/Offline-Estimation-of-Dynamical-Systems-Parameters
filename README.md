# Simulation & Modelling of Dynamical Systems
## Offline Estimation of Dynamical System Parameters

**Author:** Nikolaos Konstas  
**Institution:** Department of Electrical & Computer Engineering, Aristotle University of Thessaloniki  
**Date:** June 2023  

## Project Overview
### Problem 1 - Mass-Spring-Damper
Objective: The goal is to model and estimate the parameters of a mass-spring-damper system.

Description: This section focuses on analyzing a mass-spring-damper system, which involves determining its parameters such as mass, damping coefficient, and spring constant. The approach includes transforming the system's differential equations into a linear format to facilitate parameter estimation. The least squares method is used to estimate these parameters by minimizing the error between predicted and actual measurements. The MATLAB implementation details the steps to solve the equations, apply filters, and assess the accuracy of the parameter estimates.

### Problem 2 - Electric Circuit
Objective: The aim is to estimate the transfer matrix of an electric circuit and address noise issues.

Description: This problem involves analyzing an electric circuit to determine its transfer matrix. The analysis includes defining the relationships between various circuit elements and deriving the differential equations governing the system. By linearizing these equations using appropriate filters, the circuit's parameters can be estimated. The transfer matrix is obtained through Laplace transform analysis, providing insights into the circuit’s dynamic behavior and response characteristics.

## Report

For a detailed explanation of the project's objectives, methods, and results, please refer to the [full project report](Report.pdf).

## Technologies Used

- **Languages:** MATLAB

## How to Run

Run 'Problem 1/SpringDamperMass.m' and 'Problem 2/main.m' in MATLAB.
