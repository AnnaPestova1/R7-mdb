# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...# README -- Code The Dream Backend Movie Database

This repository contains the framework for the movie database application called "mdb" in the following Treehouse video for Active Record Associations in Rails:
https://teamtreehouse.com/library/polymorphic-options .  You should create a git branch called mdb and make your changes there.
When you are done with the application, because you have completed all the changes from the Treehouse videos, you can git add, commit, and push your changes and
make a pull request.

The first thing you will have to do is to complete the setup.  This is described in the Teacher's Notes at the link above.  You do not do the rails new command,
as that has been done for you.  You start with the rails g scaffold Movie command as described in the notes and complete the directions in those notes and in the
video.




commands: 
bin/rails g scaffold Movie title:string duration:integer
bin/rails g scaffold Show title:string episodes:integer
bin/rails g scaffold Actor name:string
bin/rails g migration AddProductionToActor production_id:integer production_type:string
bin/rails db:migrate

If you prefer, there's an alternate syntax for adding the _id and _type reference fields to the migration:

bin/rails g migration AddProductionToActor production:references{polymorphic}

Now we need to set up the polymorphic association in the model classes:

class Movie < ApplicationRecord
  has_many :actors, as: :production
end
class Show < ApplicationRecord
  has_many :actors, as: :production
end
class Actor < ApplicationRecord
  belongs_to :production, polymorphic: true
end
With all that set up, you can add an Actor to either a Show or a Movie in the Rails console:

show = Show.create(title: "Game of Thrones")
show.actors
show.actors.create(name: "Peter Dinklage")
show.actors.create(name: "Lena Headey")
pp Show.first.actors
Actor.first.production
movie = Movie.create(title: "Fight Club")
movie.actors.create(name: "Brad Pitt")
movie.actors.create(name: "Edward Norton")
Movie.first.actors
pp Actor.all