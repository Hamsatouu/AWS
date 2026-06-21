# Projet Création VPC AWS avec Terraform

## Présentation
Ce projet consiste à déployer une infrastructure réseau de base sur AWS à l’aide de Terraform.

L’infrastructure comprend :
- un VPC personnalisé
- un sous-réseau public
- un sous-réseau privé
- une Internet Gateway
- une NAT Gateway
- un Bastion Host
- une instance EC2 privée
- des tables de routage et des groupes de sécurité

Ce projet a été réalisé dans le cadre de ma montée en compétences en cloud et DevOps afin de renforcer ma pratique sur AWS, le réseau cloud et l’Infrastructure as Code.

## Objectifs
- Créer un VPC AWS avec Terraform
- Déployer un sous-réseau public et un sous-réseau privé
- Configurer l’accès Internet pour le sous-réseau public
- Permettre l’accès Internet sortant depuis le sous-réseau privé via une NAT Gateway
- Sécuriser l’accès SSH grâce à un Bastion Host
- Pratiquer l’Infrastructure as Code avec Terraform

## Architecture
L’architecture déployée contient :
- **VPC** : réseau principal isolé
- **Sous-réseau public** : héberge le bastion et la NAT Gateway
- **Sous-réseau privé** : héberge une instance EC2 privée sans IP publique
- **Internet Gateway** : permet l’accès Internet aux ressources publiques
- **NAT Gateway** : permet aux ressources privées de sortir vers Internet
- **Security Groups** : contrôlent les flux SSH et les communications réseau

## Structure du projet
```text
terraform-aws-vpc/
├── provider.tf
├── variables.tf
├── data_sources.tf
├── vpc.tf
├── igw.tf
├── nat_gateway.tf
├── security_groups.tf
├── bastion.tf
├── instance.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

## Technologies utilisées
- Terraform
- AWS VPC
- AWS EC2
- AWS Internet Gateway
- AWS NAT Gateway
- AWS Security Groups
- Amazon Linux

## Rôle des fichiers Terraform
- `provider.tf` : configuration du provider AWS
- `variables.tf` : définition des variables
- `data_sources.tf` : récupération dynamique de l’AMI
- `vpc.tf` : création du VPC et des sous-réseaux
- `igw.tf` : création de l’Internet Gateway et de la table de routage publique
- `nat_gateway.tf` : création de la NAT Gateway et de la table de routage privée
- `security_groups.tf` : configuration des groupes de sécurité
- `bastion.tf` : déploiement du Bastion Host
- `instance.tf` : déploiement de l’instance privée
- `outputs.tf` : affichage des sorties utiles Terraform
- `terraform.tfvars` : valeurs des variables du projet

## Étapes de déploiement

### 1. Initialiser Terraform
```bash
terraform init
```

### 2. Vérifier le plan d’exécution
```bash
terraform plan
```

### 3. Appliquer l’infrastructure
```bash
terraform apply
```

### 4. Afficher les outputs
```bash
terraform output
```

### 5. Détruire l’infrastructure
```bash
terraform destroy
```

## Exemples d’outputs
- IP publique du bastion
- IP privée de l’instance privée
- ID du VPC
- ID du sous-réseau public
- ID du sous-réseau privé

## Sécurité
- L’accès SSH au bastion est contrôlé par un groupe de sécurité dédié
- L’instance privée ne possède pas d’IP publique
- L’accès à l’instance privée se fait via le bastion
- Les fichiers sensibles comme les clés `.pem` et les fichiers d’état Terraform ne doivent pas être poussés sur GitHub

## Difficultés rencontrées
Au cours de ce projet, plusieurs problèmes techniques ont dû être corrigés :
- mauvaise configuration des identifiants AWS
- absence de key pair EC2
- mauvaise utilisation de l’argument des security groups pour des instances dans un VPC
- compatibilité Free Tier pour le type d’instance EC2
- ajustements Terraform pour obtenir un déploiement fonctionnel

Ces erreurs m’ont permis de mieux comprendre le fonctionnement réel d’AWS et de Terraform lors d’un déploiement.

## Compétences développées
- fondamentaux réseau sur AWS
- conception d’un VPC
- configuration de sous-réseaux publics et privés
- gestion des routes et de l’accès Internet
- mise en place d’un Bastion Host
- structuration d’un projet Terraform
- pratique de l’Infrastructure as Code
- dépannage d’erreurs de déploiement Terraform

## Améliorations possibles
- restreindre encore plus l’accès SSH à une IP précise
- ajouter un schéma d’architecture
- ajouter des captures d’écran AWS et Terraform
- refactoriser le projet en modules Terraform réutilisables
- déployer l’architecture sur plusieurs Availability Zones
- ajouter une validation Terraform dans un pipeline CI/CD

## Auteur
Dandaré Nayé  
Étudiant en Master 1 en gestion de projet informatique, en montée en compétences sur le cloud et le DevOps à travers des projets pratiques sur AWS et Azure.
