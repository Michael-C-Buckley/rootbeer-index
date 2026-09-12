# Rootbeer index

Recipes live in `recipes/*.lua`. Use canonical lowercase names and exact upstream
versions. Increment revisions when changing an existing recipe. Do not edit generated
indexes or add hand-written checksums without verifying the upstream bytes.

Run `rb package --catalog recipes check` and the native checks in `scripts/build.py`.
Declare only platforms that the workflow can test. Source builds execute trusted
upstream code; never expose publication credentials to build or pull-request jobs.

Changes target main. Do not commit or push without the user's instruction.
Publication requires all declared versions and platforms. Never remove retained
snapshots, receipts, or OCI manifests needed by existing lockfiles.
