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

resources:
  - name: vault
    type: hashicorp-release
    source:
      project: vault
```

To get the latest `vault` build for `linux_amd64`:

```yaml
- get: vault
  params:
    regexp: linux_amd64
```

## Source Configuration

* `project`: *Required.* The Hashicorp project name.
    Example: `vault`

## Behavior

### `check`: Check for new release versions

### `in`: Fetch release

Downloads all (or a subset specified by `regexp` parameter) of builds for a version.

Also creates files:

* `version` file with the current version
* `project` file with the project name

#### Parameters

* `regexp`: *Optional.* If provided, only matching files will be downloaded. Otherwise all builds will be downloaded.

### `out`: Not implemented

If you want to upload a new Hashicorp version, perhaps visit https://www.hashicorp.com/jobs/

## Build docker image

```
docker_user=starkandwayne
docker build -t $docker_user/hashicorp-release-resource .
docker push $docker_user/hashicorp-release-resource
```
