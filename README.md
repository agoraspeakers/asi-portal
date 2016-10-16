# ASI Portal

Prototype for [Agora Speakers International](www.agoraspeakers.org)
Portal.

## Code / Issues

https://github.com/agoraspeakers/asi-portal

## Requirements

This project is build with Ruby and Ruby on Rails.

Usual installation path requires:

0. install MySQL/MariaDB
0. install JavaScript engine like `nodejs`
1. install [`ruby`](ruby-lang.org)
2. install `bundler`: `gem install bundler`
3. install project dependencies: `bundle install`

## Running project

0. in database engine create user `asi` with password `asi` with rights
   to create databases
1. run `rails db:setup` to initialize database (`rails db:migrate` to only update)
2. in `rails c` create admin user: `User.create(name: 'Michal Papis', email: 'mpapis@gmail.com', password: 'testtest', role: 'admin', address: 'Kossaka 3/4, Gorzów, Poland')`
3. run `rails server` to start the application
4. open browser at http://localhost:3000

## License

[GNU Afero GPL](https://www.gnu.org/licenses/agpl-3.0.html)

## Contributions

1. Discuss,
2. Clone,
3. Update,
4. Open PR.

Before putting any effort into the project please discuss with other
developers to avoid duplicate work or unecessary efforts.
