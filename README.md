multirepo
=========

An easy to use tool to clone and manage multiple git repositories at once.

Inspired by [Google's repo][1].

Configuration
-------------

multirepo uses a manifest XML file, which enumerates the repos to manage. For each repo, you MUST provide thw following properties:

* a `url` in form of a GIT url, to clone the repo from
* a `branch` to checkout
* a `path`, relative to the current directory, to clone the repo into

Here is an example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<project url="git@server:git/project1" branch="master" path="proj1" />
	<project url="git@server:git/project2" branch="mybranch" path="proj2" />
</manifest>
```

The manifest file MUST comply to the following DTD schema file:

```xml
<?xml encoding="UTF-8"?>
<!ELEMENT manifest (project)+>
<!ATTLIST manifest
    xmlns CDATA #FIXED ''>
<!ELEMENT project EMPTY>
<!ATTLIST project
    xmlns CDATA #FIXED ''
    branch  #REQUIRED
    path  #REQUIRED
    url CDATA #REQUIRED>
```

Usage
-----

Simply run multirepo and pass the path of the manifest file as first argument:

```sh
multirepo /path/to/manifest.xml
```

For each project, if its `path` exists in the current directory, its `branch` will be checked out and pulled from its remote. If it doesn't exist, the repo will be cloned from its `url` in its `path`.

If you pass more arguments, they will be used to invoke git in each project directory. For example, to push all projects:

```sh
multirepo /path/to/manifest.xml push
```

Installation
------------

On OSX, install it via [Homebrew][2] tap:

```sh
brew tap venator85/multirepo https://github.com/venator85/multirepo/
brew install multirepo
```

License
=======

    Copyright 2016 Alessio Bianchi

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


 [1]: https://code.google.com/p/git-repo/
 [2]: http://brew.sh/