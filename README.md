![Proco Manager](app/assets/images/light-proco-logo.png)

# Proco Manager

A database-driven website to manage quizzes, each consisting of a set of multiple-choice questions and their associated answers. The website’s capabilities is only accessible to registered users. 

* Users with **Edit permission** can **view and edit questions and answers**.
* Users with **View permission** can **view questions and answers**.
* Users with Restricted permission can only **view questions**.

## Development

The required versions of build tools is defined in
[.tool-versions](.tool-versions). These can be automatically installed with
[asdf-vm](https://asdf-vm.com/), see their [installation
instructions](https://asdf-vm.com/#/core-manage-asdf).

Once installed, run:

```
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add yarn
asdf install
```

## Setting up the app in development

1. Run `bundle install` to install the gem dependencies
2. Run `yarn` to install node dependencies
3. Run `rails db:create` then `rails db:migrate` to set up the database development
4. Run `bundle exec rails server` to launch the app on http://localhost:3000

## Running specs

```
bundle exec rspec
```

## Registration


* On the registration page you will be asked which type of user you wish to register as, choose `Restricted permission`, `View permission`, `Edit permission` as appropriate.
