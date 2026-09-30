# TP : Construire une mini-CNAPP locale avec Trivy, Syft, Grype et Kubescape


- Objectifs
Ce TP permet de:

Comprendre la logique d’une mini-CNAPP locale.
Scanner une image de conteneur avec Trivy.
Générer un SBOM avec Syft.
Scanner une image avec Grype.
Scanner un SBOM avec Grype.
Scanner des manifests Kubernetes avec Trivy.
Scanner des manifests Kubernetes avec Kubescape.
Produire des rapports JSON exploitables.
Consolider plusieurs résultats dans un rapport unique.
Comprendre la complémentarité entre scan image, SBOM, vulnérabilités, configuration Kubernetes et posture sécurité.
Interpréter un code de retour dans un contexte CI/CD.

- Outils utilisés
Les outils utilisés via Docker sont :

aquasec/trivy:0.71.0
ghcr.io/anchore/syft:v1.45.1
ghcr.io/anchore/grype:v0.114.0
kubescape

- Image utilisée
python:3.4-alpine

