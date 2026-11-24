# PlaZ-LST
PlaZ-LST provides the **PlaZ plausibility rule set** for railway signalling
(*Leit- und Sicherungstechnik*, LST), together with the Java feature that runs
it in the [Eclipse SET](https://projects.eclipse.org/projects/technology.set)
Toolbox.

It checks **PlanPro** XML files (the German digital exchange format for
signalling planning data) against Schematron rules and generates reports in
SVRL, HTML, and PDF formats.

## Repository
- `plaz-src/` — project resources and supporting materials
- `java/bundles/` — Java plug-in bundles for executing and transform the Schematron rules
