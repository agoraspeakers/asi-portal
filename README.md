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

## Deployment

0. in database engine create user `asi` and database `asi_portal_production`
1. copy `config/deploy/production.rb` to new file and point to your server
1. copy `config/environments/production.rb` to file name from 1. - update content
2. edit `config/database.yml` and `config/secrets.yml` - duplicate `staging` section with name from 1.
3. commit and push `git` changes
4. run `cap new_server check` - `new_server` is the file name from 1.
5. on the server in `shared/.env` set up your environment variables from local `.env.example`
6. deploy `cap new_server deploy`
7. configure webserver to serve the site, eg:

    ```nginx
    server {
      passenger_enabled on;
      rails_env production;
      root /home/user/apps/asi-portal/current/public;
    }
    ```

## License

[GNU Afero GPL](https://www.gnu.org/licenses/agpl-3.0.html)

## Contributions

1. Discuss,
2. Clone,
3. Update,
4. Open PR.

Before putting any effort into the project please discuss with other
developers to avoid duplicate work or unnecessary efforts.
