# pgmac-ghar

This is my custom image to run the GitHub Actions Runners from

It is built from the [https://github.com/actions/actions-runner-controller](GitHub Actions Runner Controller)

## Additions

* ssh-askpass

## Building it

Dead simple, really:

```docker buildx build --tag pgmac-ghar-dind-rootless:0.0.1 .```

`0.0.1` is just the tag, set that to something unique. Keep it semver to keep it simple.

I really should auto-magic the build of this, based off a tag.

Then, push this to your favourite docker registry.

## TODO

- auto-builds
- Keep it simple. Only add the bits we need for all the things
