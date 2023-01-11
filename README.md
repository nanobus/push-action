# NanoBus Push

A Github action to automate packaging and pushing a Nanobus application to a supported registry, such as https://reg.candle.run.

Not every OCI registry supports the artifact format that is used by NanoBus, so Candle (https://candle.dev) has created a free registry that supports it. You can sign up for a free account at https://reg.candle.run.

When you create your account, you can look at your profile and see the CLI token that can be used for the password.  Make sure you have created a "New Project" in the Candle registry before you attempt to push.

See a working example of push that is used to package and push the NanoBus documentation as part of a CI-CD process: https://github.com/nanobus/examples/blob/main/.github/workflows/nanochat.yml

# Usage
```
- name: Package and push
        uses: nanobus/push-action@v1
        with:
          path: "nanobus_app/bus.yaml"
          username: ${{ secrets.CANDLE_REG_USERNAME }}
          password: ${{ secrets.CANDLE_REG_PASSWORD }}
```

## Inputs

### `path`

**Description:** Path to the bus.yaml. This file contains the registry configuration details. Defaults to `bus.yaml` which would be present in the root directory for the git repo.
**Required:** true
**Default:** `bus.yaml`

### `username`

**Description:** Username for registry
**Required:** true

### `password`

**Description:** Password for registry
**Required:** true

## Outputs

### `tag`
**Description:** The image tag that was pushed

# License

The scripts and documentation in this project are released under the Apache License 2.0.