# CONTRIBUTING
We would like to branch from master and submit PRs to to master. You should include the desired version in your PR for later tagging.

For version differences and when to use MAJOR.MINOR.PATCH changes, please see [README.md](./README.md) under Version Differences.

## Releases
1. Review the PR 
    * Assure you have included the desired new version
    * Assure the PR has included changes in the CHANGELOG for the module
2. After the PR has been tested and accepted, merge it!
3. Go to releases in GitHub and add a release to the correct merged commit SHA
    * Tag the master commit SHA with a tag including the folder module name and the desired version. (i.e. If the folder with the module code is `./node-pools/` and the desired version is `v1.0.1` then your tag would be `node-pools-v1.0.1`)
