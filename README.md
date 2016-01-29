# Library Data Modeling

![library photograph](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/rails/library.jpg)

## Objectives  
1. Learn how to generate migrations
2. Learn how to create tables 
3. Learn how to map out the relationships/associations between models

## Instructions

You will create a data model for a state's library system. There will be *at least* eight models:

1. county
2. library
3. member
4. book
5. author
6. checkout  
7. genre  

###### Draw the Domain  
Make sure to invest time thinking about your models by drawing them out. Using the white boards, paper, or the sticky pads available in class, draw a picture of the models you will need. Draw associations between your tables or use the excel method discussed in class to map out the associations between your tables.
  
###### Fill Out Models and Migrations
Use the information provided in the *Facts* section to create the appropriate tables and fill out the correction   associations for your models.
  
###### Run the Testing Suite
  Make sure it passes.  
  
### Facts

##### Books
* Books have a title and a description.
* Books can have more than one author.
* Books can have more than one genre.
* The same book (title) can live in many libraries at the same time.
* Once books have been checked out, they can always be checked out again.
  
##### Authors
* Authors have a name (J.K. Rowling, J. D. Salinger, F. Scott Fitzgerald, etc.)
* Authors write at least one book, but usually more. Stephen King has written more than fifty novels including *The   Shining*, *Carrie*, and *Pet Sematary*.
  
##### Genres
* Genres have a name (mystery, romance, humor, etc.).
* There isn't just one book that falls in the mystery genre, there are quite a few: *Gone Girl* by Gillian Flynn, *Claire DeWitt and the Bohemian Highway* by Sara Gran, and *The Maltese Falcon* by Dashiell Hammett to name a few.
  
###### Members
* Members have a name.
* Members can have more than one county.
* As a library member, you can checkout more than one book.
  
##### Libraries
* Libraries have an address.
* Libraries have a name.
* Libraries hold a ton of books, not just one.
* Libraries are located in a specific county.
  
##### Counties
* Counties have a name (Kings Country, Westchester Country, Queens Country, etc.)
* Counties have a few libraries in them. For instance, in Denver, CO there is large, centrally located library called   the Denver Public Library and several smaller ones (Byers Branch Library, Ford-Warren Branch Library, etc.)
* Counties have many library members.
  
###### Checkouts
* Members checkout a book.
* There is a start date and a due date.


## Resources
* [Has Many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association)
* [Has Many Through](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association)
* [Belongs To](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/rails-associations-library' title='Library Data Modeling'>Library Data Modeling</a> on Learn.co and start learning to code for free.</p>
