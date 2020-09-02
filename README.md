# create-preview

Easily register and deploy a component to a new preview environment on the [Architect Cloud](https://www.architect.io/).

Suggestions and issues can be posted on the [issues page](https://github.com/architect-team/create-preview/issues).

[Inputs](#Inputs)
* [email](#email)
* [password](#password)
* [account](#account)
* [environment](#environment)
* [platform](#platform)
* [component_name](#component_name)
* [component_file](#component_file)
* [deploy_flags](#deploy_flags)

## Inputs

### `email`

**Required** Email used to log in to the Architect Cloud

### `password`

**Required** Password used to log in to the Architect Cloud

### `account`

**Required** Architect Cloud account for the registered component and the created environment

### `environment`

**Required** Name of the environment which will be created

### `platform`

**Required** Platform to create the new environment on

### `component_name`

**Required** Name of the component to be registered

### `component_file`

Architect component file path and name. Defaults to `./architect.yml`

### `deploy_flags`

Any -i or -p flags to be used in the deployment step if interfaces or parameters should be modified

## Example usage

The following will be executed by the workflow job below:
* Log user into the Architect Cloud
* Register the component located at the path `component_file` with the name:tag combination `component_name`:`environment`
* Create a new Architect environment on the existing platform specified that belongs to the account specified
* Deploy the registered component to the new environment using any deploy flags specified by `deploy_flags

```yaml
jobs:
  architect_create_preview:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-node@v1
    - name: Create Preview
      uses: architect-team/create-preview@v1.0.0
      with:
        email: ${{ github.event.inputs.email }}
        password: ${{ secrets.PASSWORD }}
        account: ${{ github.event.inputs.account }}
        environment: $GITHUB_RUN_ID
        platform: ${{ github.event.inputs.platform }}
        component_name: ${{ github.event.inputs.component_name }}
```
