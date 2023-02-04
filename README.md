Welcome to your new dbt project!

### Using the starter project

#### Basics
Try running the following commands:
- `dbt seed`: add data from sources inside models/seeds
- `dbt debug`: to confirm that you can successfully connect
- `dbt run`: run all model-sql inside models; select specific model by using --select option
- `dbt test`: test all criterions within schema.yaml file
- `dbt docs generate`: generate doc file in json file
- `dbt docs serve`: open doc file in browser

#### Flags

- `-s`, `--select`: select specific models, seeds, directories
- `--target`: select target defined within profile.yml

### Tutorial Tips

- **Correspondence of yml and data folder**: Inside *dbt_project.yml*, the models configuration setting level is the same as the files indside models directory. For example:
  ```YAML
  models:
      jaffle_shop: # dbt project: top level
          +materialized: table
          staging: # sub-model level: staging
              +materialized: table
  ```
- **Override setups of profile.yml**: Like basic model configuration section in `dbt_project.yml`, you can also setup for seed even including column types E.g.
  ```YAML
  seeds:
      jaffle_shop:
          +schema: view
          raw_customers:
              +column_types:
                  first_name: char(2)
  ```

### dbt-postgres Profile Setup
E.g.

```Yaml
rd_data_team:
  outputs:

    dev:
      type: postgres
      threads: 1
      host: <host>
      port: 5432
      user: <username>
      pass: <password>
      dbname: dds
      schema: <development schema like dbt_jerrychen>

    prod:
      type: postgres
      threads: 1
      host: <host>
      port: 5432
      user: <username>
      pass: <password>
      dbname: dds
      schema: <production schema>

  target: dev
```


### Schema Setup

The schema in dbt is set as `<target_schema>_<custom_schema>` by default.

- **Top-Level**: Configure inside models (*.sql): this will override any other setting
  
  ```SQL
  {{ config(materialized='table', schema='your_schema') }}
  ```

- Configure inside dbt_project.yml (project-level, custom-level)

  ```YAML
  # setup after materialized
  model:
    jaffle_shop:
      materialized: table
      +schema: your_schema
  ```
  
  Note: This is also called *custom schema*

- **bottom-Level**: Configure inside profile.yml (default-level)

  ```YAML
  jaffle_shop:
    target: dev
    outputs:

      dev:
        type: postgres
        threads: 1
        host: localhost
        port: 5432
        user: <username>
        pass: <password>
        dbname: localDB
        schema: your_default_schema
  ```

### Resources:
- Source file in `seeds` came from here: [Jaffle-Shop GitHub](https://github.com/dbt-labs/jaffle_shop)
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
