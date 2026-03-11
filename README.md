# Bedrock Linux bpt repositories

This is a collection of Bedrock Linux `bpt` package build definitions
(`*.bbuild`)` and infrastructure to manage associated repository maintenance
operations:

- Building binary packages (`*.bpt`) from package build definition
  (`*.bbuild`)
- Building repository indices (`pkgidx` and `fileidx`).
- (Re)signing all of the above mentioned files, including updated `*.bbuild`
  files.
- Checking for upstream package updates.

## Directory structure

This repository contains two sub-repositories:

- `main`: Official Bedrock Linux packages with a dedicated package maintainer.
- `community`: Community-contributed packages.  These are checked before
  acceptance, but maintenance may be slow or non-existent.

## Submitting bbuild changes without signing

Submission bbuilds to this repository from non-Bedrock Linux team members are
not expected to be signed.  If you are interested in contributing, simply
submit your proposal - a patch file, a GitHub Pull Request, etc - without the
file's signature taken into consideration.  Should your proposal be accepted by
a Bedrock Linux team member, that member will sign it before it is made
available in the official Bedrock Linux repositories.

## Checking for upstream updates

The `bpt` package definition format (`*.bbuild`) includes a section for
querying upstream package version (`upstream_pkgver()`).  The provided `make
check-update` recipe will run this for all discovered package build definitions
and print a list of packages with available updates.

## Updating binary files and signatures

If you have access to the Bedrock Linux build system private key or have forked
this repository for use as a third-party repository and wish to update the
signatures and various generated binary files for use by `bpt`:

1. Ensure `bpt` is available in the `$PATH`.
2. Configure `/etc/bpt/bpt.conf`'s `[make-repo]` section.
3. Ensure the build key is found at `$HOME/.minisign/minisign.key` and that you
   know its passphrase.
4. Run the `make sign` to sign your `*/*.bbuild` files.
5. `make` and when prompted provide the `minisign` secret key passphrase.
