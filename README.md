# Icons

Icons provided by [iconify](https://icon-sets.iconify.design/). You can view
all the icons and their licences at [Icônes](https://icones.netlify.app/). To
use a icon add `i-` to the start and replace `:` with `-`, this will for 
example switch `ic:baseline-10k` to `i-ic-baseline-10k`.

## Installation

The installation will not be saved on git, please put the 
`./.neum/Icons/install.sh` in a build script or some way for whoever is 
compiling the `.neum` files to know that they have to run it.

### Reqirements

#### Linux / Mac

- `curl`
- `jq`
- `git`
- `bash`

#### Windows

TBA

### If you are developing in a git project do:

```sh
git submodule add https://github.com/NeumCSS/Icons .neum/Icons
```

#### Linux / Mac

```
./.neum/Icons/install.sh
```

#### Windows

TBA

### Otherwise:

```sh
git clone https://github.com/NeumCSS/Icons .neum/Icons
```

#### Linux / Mac

```
./.neum/Icons/install.sh
```

#### Windows

TBA
