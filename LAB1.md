```bash
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