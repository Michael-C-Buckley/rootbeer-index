# Rootbeer index

Recipes live in `recipes/*.lua`. Use canonical lowercase names and exact upstream
versions. Increment revisions when changing an existing recipe. Do not edit generated
indexes or add hand-written checksums without verifying the upstream bytes.

Run `rb package --catalog recipes check` and `rb package --catalog recipes export
--registry tale/rootbeer-index --output result`. Tests for these commands live in
the Rootbeer engine repository.
Declare only platforms that the workflow can test. Source builds execute trusted
upstream code; never expose publication credentials to build or pull-request jobs.

Changes target main. Do not commit or push without the user's instruction.
Publication requires all declared versions and platforms. Never remove retained
snapshots, receipts, or OCI manifests needed by existing lockfiles.

Choose the newest upstream release available for each platform. Use
`default_versions` for platforms whose newest supported release differs from
`default_version`; never hold every platform back for one discontinued target.
Keep explicit version requests exact and retain older recipes for existing locks.

Do as little CI work as possible: reuse verified package results when their
recipe, dependency recipes, platform, engine, and build environment are unchanged.
Keep full qualification available for scheduled and explicit rechecks.
