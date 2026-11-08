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
```mermaid
flowchart TB
    G1["G1 — VPC<br/>10.0.0.0/16"]

    subgraph VPC["AWS VPC"]
        G2["G2 — Public Subnet<br/>10.0.1.0/24"]
        G4["G4 — Security Group<br/>HTTP : 80<br/>SSH : 22"]
        G5["G5 — EC2 Ubuntu<br/>t3.micro"]

        G2 --> G5
        G4 --> G5
    end

    G1 --> G2
    G3["G3 — Internet Gateway"]
    G3 <-->|"Route table : 0.0.0.0/0"| G2

    G6["G6 — S3 Bucket<br/>Private storage"]

    INTERNET(("Internet")) <-->|"HTTP / SSH"| G3

    style G1 fill:#dbeafe,stroke:#2563eb,color:#1e3a8a
    style G2 fill:#dbeafe,stroke:#2563eb,color:#1e3a8a
    style G3 fill:#ffedd5,stroke:#ea580c,color:#9a3412
    style G4 fill:#dcfce7,stroke:#16a34a,color:#166534
    style G5 fill:#dcfce7,stroke:#16a34a,color:#166534
    style G6 fill:#f3e8ff,stroke:#9333ea,color:#581c87
```