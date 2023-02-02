Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- `dbt seed`: add data from sources inside models/seeds
- `dbt debug`: to confirm that you can successfully connect
- `dbt run`: run all model-sql inside models; select specific model by using --select option
- `dbt test`: test all criterions within schema.yaml file
- `dbt docs generate`: generate doc file in json file
- `dbt docs serve`: open doc file in browser

### Some Tips

- Inside *dbt_project.yml*, the models configuration setting level is the same as the files indside models directory. For example:
    ```python
    models:
        jaffle_shop: # dbt project: top level
            +materialized: table
            staging: # sub-model level: staging
                +materialized: table
    ```

### Resources:
- Source sample data [GitHub](https://github.com/dbt-labs/jaffle_shop)
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
