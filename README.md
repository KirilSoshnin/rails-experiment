# Rails Experiment

This project is used to experiment with Ruby on Rails.

Versions:

- Ruby 2.6.5
- Rails 5.0.2

Below are some helpful notes.

## VSCode

The following extensions are recommended:

- Ruby
- Rubocop
- Prettier - Code formatter

For Rubocop, you will also need to install its gem (preferrably in a global gemset):

```
gem install rubocop
```

To install the Ruby plugin for Prettier, run the following commands:

```
cd ~/.vscode/extensions/esbenp.prettier-vscode-{YOUR VERSION}/
npm install @prettier/plugin-ruby
```

Then, reload window in VSCode.

## RVM

To manage different versions of Ruby, you can use RVM. That way, you can also create different gemsets to manage different versions of Rails.

Useful commands:

- `rvm list`
- `rvm install {VERSION}`
- `rvm use {VERSION}`
- `rvm gemset list`
- `rvm gemset create {NAME}`
- `rvm gemset use {NAME}`

After installing RVM, open the `~/.bashrc` or `~/.bash_profile` file and add the following line:

```
source ~/.rvm/scripts/rvm
```

## PostgreSQL

On Mac OS, you can install the PostgreSQL application. If that is the case, add the following line to the `~/.bashrc` or `~/.bash_profile` file:

```
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
```

## Rails

### Installation

To install Rails, select the appropriate gemset with RVM and run:

```
gem install rails
```

Use the `-v` flag to specify a version, for example:

```
gem install rails -v 5.0.2
```

To create a new Rails application, run:

```
rails new AppName
```

Use the `--skip-coffee` and `--database=postgresql` flags as needed.

You can also use `-B` to skip bundle install and `-T` to exclude tests.

### Database

To create and migrate the database, run:

```
rails db:create
rails db:migrate
```

### Scaffolds

For example, run the following command to create a scaffold of a blog:

```
rails g scaffold post title:string body:text
```
