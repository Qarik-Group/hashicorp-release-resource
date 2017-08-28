# Hashicorp Release Resource

Hashicorp software releases are made available via https://releases.hashicorp.com. This Concourse resource allows you to watch for new releases and fetch them.

## Deploying to Concourse

You can use the docker image by defining the [resource type](http://concourse.ci/configuring-resource-types.html) in your pipeline YAML.

For example:

```yaml

resource_types:
- name: hashicorp-release
  type: docker-image
  source:
    repository: starkandwayne/hashicorp-release-resource
```

## Source Configuration

* `project`: *Required.* The Hashicorp roject name.
    Example: `vault`

## Behavior

### `check`: Check for new release versions

### `in`: Fetch release

#### Parameters

* None initially

### `out`: Not implemented

If you want to upload a new Hashicorp version, perhaps visit https://www.hashicorp.com/jobs/
