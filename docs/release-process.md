# Release Process

This document outlines the process for releasing new versions of the Sample Project.

## Version Numbering

We follow [Semantic Versioning](https://semver.org/):

- **Major version (X.0.0)**: Incompatible API changes
- **Minor version (0.X.0)**: Backwards-compatible functionality
- **Patch version (0.0.X)**: Backwards-compatible bug fixes

## Release Checklist

Before creating a release:

1. **Verify Tests**: Ensure all tests are passing

   ```bash
   make test
   ```

2. **Check Code Quality**: Run all linters and type checkers

   ```bash
   make lint
   ```

3. **Update Documentation**: Ensure documentation is up-to-date

   - Update API references if needed
   - Add release notes to `CHANGELOG.md`
   - Update version numbers in documentation

4. **Update Version**: Update the version in `pyproject.toml`

   ```toml
   [project]
   name = "project_example"
   version = "X.Y.Z"  # Update this line
   ```

5. **Create Release Commit**:

   ```bash
   git add pyproject.toml CHANGELOG.md
   git commit -m "chore: release version X.Y.Z"
   ```

6. **Create Git Tag**:

   ```bash
   git tag -a vX.Y.Z -m "Version X.Y.Z"
   ```

7. **Push to GitHub**:

   ```bash
   git push origin main
   git push origin vX.Y.Z
   ```

## Creating a Package

To build the distribution package:

```bash
python -m build
```

This will create two files in the `dist/` directory:

- `project_example-X.Y.Z-py3-none-any.whl` (Wheel package)
- `project_example-X.Y.Z.tar.gz` (Source distribution)

## Publishing to PyPI

To publish the package to PyPI:

```bash
python -m twine upload dist/*
```

You will need PyPI credentials to complete this step.

## Post-Release Tasks

After releasing:

1. **Create GitHub Release**: Document the release on GitHub

   - Go to Releases > Draft new release
   - Select the tag you created
   - Add release notes

2. **Announce the Release**: Inform users through appropriate channels

3. **Update Development Version**: Increment version in `pyproject.toml` with dev suffix

   ```toml
   [project]
   version = "X.Y.(Z+1)-dev"
   ```

4. **Create Development Commit**:

   ```bash
   git add pyproject.toml
   git commit -m "chore: bump version to X.Y.(Z+1)-dev"
   git push origin main
   ```

## Hotfix Process

For urgent fixes to a released version:

1. Create a branch from the release tag:

   ```bash
   git checkout -b hotfix/issue-description vX.Y.Z
   ```

2. Fix the issue and commit:

   ```bash
   git add .
   git commit -m "fix: issue description"
   ```

3. Update version to X.Y.(Z+1) in `pyproject.toml`

4. Commit version change:

   ```bash
   git add pyproject.toml
   git commit -m "chore: release version X.Y.(Z+1)"
   ```

5. Create a new tag and push:

   ```bash
   git tag -a vX.Y.(Z+1) -m "Version X.Y.(Z+1)"
   git push origin hotfix/issue-description
   git push origin vX.Y.(Z+1)
   ```

6. Create a pull request to merge the hotfix into main

7. After merging, follow the post-release tasks
