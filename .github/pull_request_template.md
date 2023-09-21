## README.md
Having a Readme.md file is mandatory for every module. Please ensure that you include the following information inside the readme file:

1. Module Name and Description:

2. Provide a clear and concise name for the module.
Include a brief description or summary of the module's purpose and functionality.
How to Use this Building Block inside meshStack:

3. Explain how to effectively utilize this module within meshStack.
Specify any required variables and inputs, along with their descriptions and usage instructions.
Creating a backend.tf File:

4. Reference the related wiki page that explains how to create a backend.tf file.
Include a link or provide clear instructions. For example: "You can find an example of how to create a backend.tf file on this  [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)."

5. Include any other pertinent details about the module.
Consider adding information such as pricing details for the workload, if applicable, to help users better understand the module's implications.

## Pull Request Description and Naming Convention

Please provide a brief summary of the changes made in this pull request.

### Branch Name:
A git branch should start with a category. Pick one of these: feature, bugfix, hotfix, or test.

    feature is for adding, refactoring or removing a feature
    bugfix is for fixing a bug
    hotfix is for changing code with a temporary solution and/or without following the usual process (usually because of an emergency)
    test is for experimenting outside of an issue/ticket

### Commit Name:
The name should follow the Conventional Commit standard and begin with a prefix (e.g. feat, fix, chore). This will help classify the change at a glance.

    feat: is for new functionality
    fix: for a fix to existing functionality
    chore: for a change that does not create new functionality but is needed (e.g. documentation, patch version bump)
    Other options also include docs:, style:, refactor: , and a few other options. We don’t use these so often as they’re generally captured by the above three.
    
## Related Issues

- List any related issues or references (e.g., Fixes #123).

## Checklist

- [ ] I have tested these module locally and in meshStack.
- [ ] I have reviewed the code for formatting and style.
- [ ] I have updated the documentation if necessary.

Thank you for your attention to these documentation requirements.