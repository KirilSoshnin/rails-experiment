# Rails Experiment

This project is used to experiment with Ruby on Rails.

Versions:

- Ruby 2.6.5
- Rails 5.0.2

Below are some helpful notes.

## VSCode

The following extensions are recommended:

- Ruby
- Prettier - Code formatter

You will also need to install this gem (preferrably in a global gemset with RVM so that you can re-use it in other projects):

```
gem install rubocop
```

Then, add the following to the `.vscode/settings.json` file:

```
{
  "ruby.useLanguageServer": true,
  "ruby.format": false,
  "ruby.lint": {
    "rubocop": true
  }
}
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

NOTE: Depending on the Rails version, you might need to install a specific version of the `bundler` gem in your global gemset.

For example, with Rails 5.0.2, you need to run the following commands:

```
rvm gemset use global
gem install bundler -v 1.17.3
```

### Database

To create and migrate the database, run:

```
rails db:create
rails db:migrate
```

### Scaffolds

For example, run the following command to create a scaffold of a blog:

```
rails g scaffold Post title:string body:text
```

### Controllers

For example, run the following command to create a controller for pages (plurial):

```
rails g controller Pages home about contact
```

### Models

For example, run the following command to create a model for skill (singular):

```
rails g model Skill title:string percent_utilized:integer
```

Run `rails db:migrate` to update the schema.

To connect directly to the database, run `rails c` to open the console.

Then, to create a record for the Skill model, run:

```
Skill.create!(title: "Rails", percent_utilized: 75)
```

(add `!` to throw errors)

Then, to show records, run `Skill.all`.

### Resources

For example, run the following command to create a resource (minimalistic scaffold) for the portfolio (singular):

```
rails g resource Portfolio title:string subtitle:text body:text main_image:text thumb_image:text
```

Don't forget to run `rails db:migrate` to update the schema.

### Generator Configuration

To configure generators, you can add the following to `config/application.rb`:

```
   config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :test_unit, fixture: false
      g.stylesheets     false
      g.javascripts     true
   end
```

Then, to customize the templates, override files through the `lib/` directory.

For more info: [https://guides.rubyonrails.org/generators.html](https://guides.rubyonrails.org/generators.html)

### Seeds

Add records to seed your database in the `db/seeds.rb` file.

Then, run the following command:

```
rails db:setup
```

(Careful, it will erase all existing data before running the seed file.)

### Routes

Manage your app's routes via the `config/routes.rb` file.

You can also run the command `rails routes` to view all existing routes, their URI pattern and controller action.

### Migration

For example, if you need to add something to the database, you can run:

```
rails g migration add_slug_to_blogs slug:string:uniq
```

(`add` and `blogs` means we will add something to the `blogs` table)

This will create a new migration file. Then run `rails db:migrate`.
