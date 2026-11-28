# LAB 1 — Infrastructure AWS collaborative

Doc : [AWS Provider — Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Architecture

```
Internet ⇄ G3 Internet Gateway ─► G4 Route Table (0.0.0.0/0 → IGW)
                                          │ association
G1 VPC 10.0.0.0/16 ──► G2 Public Subnet 10.0.1.0/24 ─┐
                  └──► G5 Security Group (80, 22) ───┴─► G6 EC2 Ubuntu t3.micro
```

## Répartition des groupes

| Groupe | Ressource | Fichier | Utilise | Fournit (output) |
|--------|-----------|---------|---------|------------------|
| G1 | VPC `10.0.0.0/16` | `g1-vpc.tf` | — | `aws_vpc.main.id` |
| G2 | Public Subnet `10.0.1.0/24` | `g2-public-subnet.tf` | G1 | `aws_subnet.public.id` |
| G3 | Internet Gateway | `g3-internet-gateway.tf` | G1 | `aws_internet_gateway.igw.id` |
| G4 | Route Table `0.0.0.0/0 → IGW` | `g4-route-table.tf` | G1, G2, G3 | `aws_route_table.public.id` |
| G5 | Security Group HTTP 80 / SSH 22 | `g5-security-group.tf` | G1 | `aws_security_group.web.id` |
| G6 | EC2 Ubuntu `t3.micro` | `g6-ec2.tf` | G2, G5 | `aws_instance.web.public_ip` |

**Règle :** chaque groupe modifie **uniquement son fichier**. Les noms de ressources (`main`, `public`, `igw`, `web`) sont un contrat entre les groupes : ne pas les renommer.

Fichiers partagés (ne pas modifier sans accord) : `versions.tf`, `providers.tf`, `variables.tf`.

## Inputs / Resources / Outputs dans la doc

| Notion | Section de la doc | Exemple (`aws_vpc`) |
|--------|-------------------|---------------------|
| **Inputs** | *Argument Reference* | `cidr_block`, `enable_dns_hostnames` |
| **Resources** | Le nom de la ressource | `resource "aws_vpc" "main"` |
| **Outputs** | *Attribute Reference* | `id`, `arn`, `main_route_table_id` |

Un groupe utilise l'**output** d'un autre groupe comme **input** :

```hcl
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id   # output de G1 → input de G2
}
```

## Exécution

```bash
cd lab-1
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output web_url    # ouvrir dans le navigateur (attendre ~1 min pour Nginx)
terraform destroy           # à la fin de la séance
```

## AWS Academy Learner Lab

- **AWS Details → AWS CLI** : coller le bloc dans `~/.aws/credentials` (le `aws_session_token` change à chaque session).
- Région `us-east-1`, key pair `vockey`.
- Toujours faire `terraform destroy` en fin de séance.