Website
---

This is the code that powers my website!

### Architecture
This repo contains the following components:
  * Database models which can be used both internally and externally.
  * The public website, including an admin interface used for essential configuration.

### Install the backend
Install the following services and configure them to run on their default ports:
  * [Ruby 2.7.3](https://www.ruby-lang.org/en/).
      * Windows: [Ruby Installer](https://github.com/oneclick/rubyinstaller2/releases/tag/RubyInstaller-2.7.3-1) is
       recommended. Default options will suffice.
      * OS X: [RVM](http://rvm.io) is recommended over the default OS X Ruby.
       Here's a one-liner: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`.
  * [MySQL 10](https://www.mysql.com/) or later.
  * NodeJS.
  * Yarn

Ensure bundler is installed: `gem install bundle`.

Run `bundle install` to download and install dependencies.

### Setup the database
Start MySQL on its default port. Then, run the following shell command from the repo:

    rake db:setup

### Run the backend app
Run the following shell commands from the repo to start all the backend services:

    rails bgm              # Public website on http://localhost:3000

At this point, you should be able to visit the website at `http://localhost:3000`.

### Contributing
My website's codebase is completely open source, and is licenced under the MIT licence. Contributions are highly
appreciated! You may leave a star too!
