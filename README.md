# Travaux pratiques collaboratifs
## À propos
Ce dépôt regroupe des travaux pratiques collaboratifs dans lesquels les étudiants travaillent en groupes pour réaliser différentes tâches et construire ensemble une solution complète.
## Évaluation
Les contributions et l'historique des commits Git seront pris en compte dans la note du **Contrôle Continu (CC)**.
**Chaque contribution laisse une trace, et cette trace compte dans votre note !**
## Workflow Git
Chaque classe doit travailler sur sa propre branche.
### 1. Cloner le dépôt
```bash
git clone <repository-url>
cd Collaborative-Terraform-Labs
```
### 2. Basculer vers la branche de la classe
```bash
git checkout CIM-J-A
git pull origin CIM-J-A
```
### 3. Réaliser le travail demandé
Chaque groupe doit modifier uniquement les fichiers correspondant à sa tâche et respecter la structure du projet définie pour le TP.
### 4. Enregistrer et envoyer les modifications
```bash
git add .
git commit -m "Groupe 1 : réalisation de la tâche assignée"
git push -u origin CIM-J-A
```
# LAB 1
[doc](https://registry.terraform.io/providers/hashicorp/aws/latest)
```mermaid
flowchart TB
    Internet(("Internet"))

    G1["G1 — VPC<br/>10.0.0.0/16"]

    subgraph AWS["AWS — Infrastructure"]
        G2["G2 — Public Subnet<br/>10.0.1.0/24"]
        G3["G3 — Internet Gateway"]
        G4["G4 — Route Table<br/>0.0.0.0/0 → IGW"]
        G5["G5 — Security Group<br/>HTTP : 80<br/>SSH : 22"]
        G6["G6 — EC2 Ubuntu<br/>t3.micro"]

        G2 --> G6
        G5 --> G6
        G4 --> G2
        G3 --> G4
    end

    G1 --> G2
    G1 --> G3
    G1 --> G4
    G1 --> G5

    Internet <--> G3
```