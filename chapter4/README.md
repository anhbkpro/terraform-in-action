# Modules

## Networking Module

### Module structure
```mermaid
flowchart LR
    subgraph inputs["Input variables"]
        namespace[namespace]
    end

    module[Networking<br/>module]

    subgraph outputs["Output values"]
        vpc[vpc]
        sg[sg]
    end

    namespace --> module
    module --> vpc
    module --> sg

    style inputs fill:#ffd4b3,stroke:#333,stroke-width:2px
    style outputs fill:#ffd4b3,stroke:#333,stroke-width:2px
```

### Managed resources provisioned by the networking module
```mermaid
flowchart TB
    variables["📄 variables.tf"]
    main["📄 main.tf"]
    outputs["📄 outputs.tf"]

    variables -->|Inputs| main
    main -->|Outputs| outputs

    main -->|Deploys| resources

    subgraph resources[" "]
        igw((Internet<br/>gateway))
        vpc[/VPC\]
        subnets[/Subnets\]
        rt[Route<br/>table]
        nat{NAT<br/>gateway}
        sg{{Security<br/>groups}}
    end

    style resources stroke-dasharray: 5 5
    style igw fill:#8b4789,stroke:#333,stroke-width:2px,color:#fff
    style vpc fill:#d4af37,stroke:#333,stroke-width:2px
    style subnets fill:#4d9f6f,stroke:#333,stroke-width:2px,color:#fff
    style rt fill:#9b87c4,stroke:#333,stroke-width:2px,color:#fff
    style nat fill:#e89b9b,stroke:#333,stroke-width:2px
    style sg fill:#3d8bae,stroke:#333,stroke-width:2px,color:#fff

    classDef fileStyle fill:#fff,stroke:#333,stroke-width:2px
    class variables,main,outputs fileStyle
```


## Database Module

### Module structure
```mermaid
flowchart LR
    subgraph inputs["Input variables"]
        namespace[namespace]
        vpc[vpc]
        sg[sg]
    end

    db[Database<br/>module]

    subgraph outputs["Output values"]
        db_config[db_config]
    end

    namespace --> db
    vpc --> db
    sg --> db
    db --> db_config
```

### Managed resources provisioned by the database module
```mermaid
flowchart TB
    variables["📄 variables.tf"]
    main["📄 main.tf"]
    outputs["📄 outputs.tf"]

    variables -->|Inputs| main
    main -->|Outputs| outputs

    main -->|Deploys| resources

    subgraph resources[" "]
        direction LR
        db{Database}
        random((Random))
    end

    style resources stroke-dasharray: 5 5
    classDef fileStyle fill:#fff,stroke:#333,stroke-width:2px
    class variables,main,outputs fileStyle
```



