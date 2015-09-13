# Contributing to Dummy
  It'd be lovely to get feedbacks and contributions from you. Here's a guide to help you do so.

  To get a general approch to open source contribution take a look at the [Github contribution guide](https://guides.github.com/activities/contributing-to-open-source/)

## Found an Issue?
  If you find anything out of the ordinary, a bug, a misspelling or an obscure bit of documentation, feel free to alert us by submitting an issue to our [GitHub Repository][issues]. You can even fix it and submit a Pull Request.

## Want a Feature?
  While we have our own agenda, you can request a new feature by submitting an [issue][issues]. We can discuss it and craft it on our own or accept your Pull request.  

## Submission Guidelines

### Submitting an Issue
  Before you submit a new issue check the closed ones, we may have already discussed about it. Be as specific as you can to help us be more efficient.

### Submitting a Pull Request
  Before submitting a pull request, open an issue to discuss it in order to prevent duplicate effort.
  - Make your changes in a new branch:

    `git checkout -b my-feature-fix master`
  - Follow our [Coding Rules][styleguide]
  - Stick to our [commit message conventions][commit]
  - Push your branch to GitHub
  - Send a Pull Request to `dummy:master`
  - If we suggest changes:
    - Make the required updates
    - Rebase your branch and force push to your GitHub repository (this will update your Pull Request):
      ```
      git rebase master -i
      git push origin my-feature-fix -f
      ```

## Coding Rules
  You can find our coding policy for each language in [Inouit/styleguide][styleguide]

## Git Commit Guidelines
  Please follow our [commit conventions][commit]


[github]: https://github.com/Inouit/Dummy
[issues]: https://github.com/Inouit/Dummy/issues
[styleguide]: https://github.com/Inouit/styleguide
[commit]: https://github.com/Inouit/styleguide/blob/master/git/commit.md
