# Learning Scala

<!-- TOC -->

- [Learning Scala](#learning-scala)
  - [Book](#book)
  - [Dev Container](#dev-container)

<!-- /TOC -->

## Book

- [Programming in Scala](https://people.cs.ksu.edu/~schmidt/705a/Scala/Programming-in-Scala.pdf)
- [Book Excercises](https://booksites.artima.com/programming_in_scala) - see [Mini Website](/programming-in-scala-exercises/index.html)

## Dev Container

To open in devcontainer:

```text
Ctrl + Shift + P > Rebuild Without Cache and Reopen in Container
```

![Devcontainer Rebuild](docs/images/devcontainer-rebuild.png)

Build starts:
![Devcontainer Build Start](docs/images/devcontainer-build-start.png)

Build ends:
![Devcontainer Build End](docs/images/devcontainer-build-end.png)

To get metals and debugging to work in VSCode, Click on `scala.code-workspace`:

![Devcontainer Workspace](docs/images/devcontainer-workspace.png)

Go to the `metals` tab, and `Import Build`:

![Devcontainer Workspace](docs/images/metals-import-build.png)

Metals will kick off a compile:

![Devcontainer Workspace](docs/images/metals-compile-build.png)

And debugging should work:

![Devcontainer Workspace](docs/images/metals-debug-button.png)

![Devcontainer Workspace](docs/images/metals-debug-hit.png)