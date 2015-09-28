

# Library Data Modeling

![library photograph](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/rails/library.jpg)

## Contents

* Objective
* Facts
* Draw the Domain
* Fill Out Models and Migrations
* Instructions
* Run the Testing Suite
* Resources

## Objective

You will create a data model for a state's library system. There will be *at least* eight models:

1. country
2. library
3. member
4. book
5. author
6. checkout
7. topic
8. genre

## Facts

##### Counties

* Counties have a few libraries in them. For instance, in Denver, CO there is large, centrally located library called the Denver Public Library and several smaller ones (Byers Branch Library, Ford-Warren Branch Library, etc.)
* Counties have a name (Kings Country, Westchester Country, Queens Country, etc.)
* Counties have many library members.

##### Libraries

* Libraries hold a ton of books, not just one.
* Libraries have an address.
* Libraries have a name.
* Libraries are located in a specific county.

###### Members

* As a library member, you can checkout more than one book. 
* Members have a name.
* Members have a county.

##### Books

* Books usually live in one library.
* Books usually are about at least one topic (if you'd like them to be about more than one, feel free to build that out keeping in mind you will need to create join table for this relationship). 
* Books have at least one author (if you'd like them to be about more than one, feel free to build that out keeping in mind you will need to create another join table for this relationship).
* Books at least one genre (if you'd like them to be about more than one, feel free to build that out keeping in mind you will need to create yet another join table for this relationship).
* Once books have been checked out, they can always be checked out again.
* Books have a title, a dewey decimal number, and a description.

##### Authors

* Authors write at least one book, but usually more. Stephen King has written more than fifty novels including *The Shining*, *Carrie*, and *Pet Sematary*.
* Authors have a name (J.K. Rowling, J. D. Salinger, F. Scott Fitzgerald, etc.)

##### Topics

* There isn't just one book about the topic genetics, there are a bunch. For instance, there's *The Selfish Gene* by Richard Dawkines, *Genetics: A Conceptual Approach* by Benjamin A. Pierce, and *The Cosmic Serpent: DNA and the Origins of Knowledge* by Jeremy Narby.
* Topics have a name (biology, philosophy, literary theory, etc.).

##### Genres

* There isn't just one book that falls in the mystery genre, there are quite a few: *Gone Girl* by Gillian Flynn, *Claire DeWitt and the Bohemian Highway* by Sara Gran, and *The Maltese Falcon* by Dashiell Hammett to name a few.
* Genres have a name (mystery, romance, humor, etc.).

###### Checkouts

* Members checkout a book.
* There is a start date and a due date.

## Instructions

#### Draw the Domain

Using the white board, paper, or the sticky pads in the back, draw a picture of the models you will need. Draw assoications between your tables. Take a picture and save the picture as "drawing" (which file extension you use doesn't matter) in the `images` folder.

#### Fill Out Models and Migrations

Fill out every model in the `app/models` folder. Fill out every migration in the `db/migrate` folder. Remember to correctly inherit from ActiveRecord in each. Remember to carry over the associations you drew out in the picture into your models and migrations.

## Run the Testing Suite

Make sure it passes. It's really just checking for completion, not correct code. To pass the last spec, open up `spec/library_spec.rb` and replace the underscore with your answer.

## Resources

* [Has Many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association)
* [Has Many Through](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association)
* [Belongs To](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)
