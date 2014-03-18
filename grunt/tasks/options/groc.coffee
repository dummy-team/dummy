module.exports =
  options:
    root:  "../"
    out:  "docs/"
    index:  "README.md"
  all:
    options:
      # `demo' directory is there to fix a strange path behavior of groc
      glob: ["README.md", "RELEASE.md", "demo/" , "js/src/*.coffee", "css/src/*.scss"]
