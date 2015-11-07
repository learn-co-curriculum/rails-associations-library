# Guide To Solving Library Data Modeling

## Objectives
1. Create a Data Model for a Library Application System


## Solving the Lab

**Step 1: Setting up the lab**

Run rspec, read the error messages and use error messages to guide your steps.

*When generating tables, make sure to pass the no-test-framework option to your rails generate command `rails generate model ModelName --no-test-framework`*

**Step 2: Determine what entities the application needs**

The whole purpose of Data Modeling is to create an accurate reflection of the real world in a database. As software developers, we first develop a conceptual data model of how the different entities/objects in the program we are building relate to each other. But first we need to determine what entities our application needs to account for.

Think about this for a moment. A library system needs to know certain things about the entities that will be utilizing it. The entities of interest here are:

- Places (Counties and Cities)
- Books
- People (Library members and book authors)

We can say the following about a library:
> A library is part of a county network. That is each county has a library network and each city in a county is part of its parent county's library network. Each county resident can checkout books from libraries that are part of his/her country. Libraries have many books and a book can be authored by more than one author. Books typically fit into one genre (fiction, romance, autobiography,etc) but some books fit into more than one genre. Some authors write and publish many books while others write and publish only one book.

Next we have to develop a database scheme that models the above situation.

From the above description, we can deduce that out restaurant reservation program needs to know, at minimum, about the following entities:

1. County
2. Library
3. Member
4. Book
5. Author
6. Genre

**Step 3: Determine the relationships between the entities in the application**
Now that we know what entities the application needs to account for, the next thing we need to do is determine the relationships between the different entities in the application.

What does this mean?

> Basically, we need to conceptualize - that is form a concept or an idea - how the entities/objects in a library system are related to each other.

Let's start by mapping out the relationship between the two major players in the application: Library and Member.

#####Library
The README for this lab states:

* Libraries have an address.
* Libraries have a name.
* Libraries hold a ton of books, not just one.
* Libraries are located in a specific county.

Open up an excel sheet and fill it with the attributes of a Library:

    id     |              address                 |        name
  ---------|--------------------------------------|--------------------
    1      |93 Saint Edwards St Brooklyn, NY 11205| Walt Whitman Library

But that's not all. The facts section of the lab indicates that:
- Libraries hold a ton of books, not just one.
- Libraries are located in a specific county.

Putting the above facts in real terms:
> Libraries always have many books. Libraries also belong to a particular county - for example, the Walt Whitman Library in Fort Green is part of of the library network in Kings County, New York.

This indicates that a `Library` model ought to declare a has_many association with books - that is `one library has_many connections` to the `Book` model. `Library` model should also declare a belongs_to association with country - meaning that one instance of the `Library` model is connected to a particular instance of the `County` model. Update `Library` model class:

```ruby
class Library < ActiveRecord::Base
  belongs_to :county
  has_many :books
end
```

Since a library belongs to a county, we need to update the `libraries` table to reflect that it has a column `county_id`:

  id |              address                 |        name         | county_id
  ---|--------------------------------------|---------------------|----------
  1  |93 Saint Edwards St Brooklyn, NY 11205| Walt Whitman Library|   1


#####Member
The README states that:
* Members have a name.
* Members can have more than one county.
* As a library member, you can checkout more than one book.

Mockup of possible `members` table:

    id     |   name   |
  ---------|----------|
    1      | John Doe |
    2      | Jane Doe |

Also:
- Members can have more than one county.
- As a library member, you can checkout more than one book.

Putting the requirements in real world terms:

> Let's assume that John Doe and Jane Doe are residents of Kings Country and that both have Brooklyn Library cards. This means that both John and Jane have access to all libraries in Brooklyn - they can checkout books from any library in Brooklyn. John grew up in Port Jefferson, New York, which is in Suffolk County. John has a  has a Coram Library Card and thus, in terms of the library membership, John has more than one country and therefore can check out books from any library in Kings County and Suffolk County.

From the information above, it appears that the `Member` model needs to declare a couple of associations.

- an instance of the `Member` model class has many connections to the `County` model class (one many has many counties)
- an instance of the  `Member` model class has many connections to the `Book` model (one member has many books - can checkout many books)
- an instance of the `Member` model class has many connections to the `Library` model class (one member has many libraries - can checkout books from many libraries)

Update `Member` model class to reflect these associations:

```ruby
class Member < ActiveRecord::Base
  has_many :counties
  has_many :libraries
  has_many :books
end
```

Let's examine the association between models `Member` and `County` for a minute. We know that:

##### Counties
* Counties have a name (Kings Country, Westchester County, Queens Country, etc.)
* Counties have a few libraries in them. For instance, in Denver, CO there is large, centrally located library called the Denver Public Library and several smaller ones (Byers Branch Library, Ford-Warren Branch Library, etc.)
* Counties have many library members.

**`counties` table**

  id  |      name    |
  ----|--------------|
   1  |     Kings    |
   2  |  Westchester |
   3  |  Long Island |

```ruby
class County < ActiveRecord::Base
  has_many :libraries
  has_many :members
end
```

The first association in `County` - an instance of County `has_many :libraries` - makes sense. A county has many cities/municipals and these places tend to have libraries - therefore counties have many libraries in them. Also recall that the `Library` model declares a `belongs_to :county` association.


Another thing to note is that since an instance of the `Library` model has many books and an instance of `County` model has many libraries, a county will have many books (via its association with libraries).  So update `Country` model to reflect this:

```ruby
class County < ActiveRecord::Base
  has_many :libraries
  has_many :books, through: :libraries

  has_many :members
end
```

The last association in `County` - that is an instance of County `has_many :members` doesn't make complete sense in light of the fact that the `Member` model declares a `has_many :counties` association.

```ruby
class Member < ActiveRecord::Base
  has_many :counties
end
```

It might look like that a county knows all the members in it and that a member knows what counties he/she belongs to but this isn't true.  To drive this point home, let's take a look at the `counties` and `members` tables and see what information we can get from the respective tables:

**`members` table**

  id     |   name   |
  ---------|----------|
    1      | John Doe |
    2      | Jane Doe |

**`counties` table**

  id  |      name    |
  ----|--------------|
   1  |     Kings    |
   2  |  Westchester |
   3  |  Long Island |


We can't tell what counties a member has by looking at the `members` table nor can we tell what members a county has by looking at the `counties` table. This reveals that both models have an indirect connection through a third model - the table of the connecting third model is usually called a join table. The question now is which one of the other 4 entities - Libraries, Books, Authors, Checkouts - joins joins the `Member` model to the `County` model? We don't know yet but examining the other entities will reveal the answer.

Let's take a look at the `libraries` table and `Library` model again:

**`libraries` table**

  id |              address                    |        name          | county_id
  ---|-----------------------------------------|----------------------|----------
  1  |93 Saint Edwards St Brooklyn, NY 11205   | Walt Whitman Library |   1
  2  |9 American Legion Drive Ardsley, NY 10502| Ardsley Public Library|  2
**`Library` model**

```ruby
class Library < ActiveRecord::Base
  belongs_to :county
  has_many :books
end
```

Recall that each member has_many counties and each country has_many libraries and that each library keeps track of what county it belongs to. Knowing this, it makes sense to say that a member has many libraries through its association with a library. If this doesn't make sense to you, think back to our real world example:

> Let's assume that John Doe and Jane Doe are residents of Kings Country and that both have Brooklyn Library cards. This means that both John and Jane have access to all libraries in Brooklyn - they can checkout books from any library in Brooklyn. John grew up in Port Jefferson, New York, which is in Suffolk County. John has a  has a Coram Library Card and thus, in terms of the library membership, John has more than one country and therefore can check out books from any library in Kings County and Suffolk County.

The situation above reveals that due to his affiliations with Kings and Suffolk countries, John has access to all the libraries in both counties (a member has many libraries through his/her affiliations with counties). Let's update the `Member` model to reflect this:

```ruby
class Member < ActiveRecord::Base
  has_many :counties
  has_many :libraries, through: :countries
  has_many :books
end
```

What about the relation between the `Library`, `Book` and `Member` models?

```ruby
class Library < ActiveRecord::Base
  has_many :books
end
```

```ruby
class Member < ActiveRecord::Base
  has_many :libraries, through: :countries
  has_many :books
end
```

Since a member has many libraries and a library has many books, we can see that a member has (access to) many books through his/her affiliation with different libraries.  Again, let's update the `Member` model to reflect this association:


```ruby
class Member < ActiveRecord::Base
  has_many :counties
  has_many :libraries, through: :countries
  has_many :books, through: :libraries
end
```

But how does a library know what books it houses? And how does a book know what library it is physically in?  Using what the README tells us about books:

##### Books
* Books have a title and a description.
* Books can have more than one author.
* Books can have more than one genre.
* The same book (title) can live in many libraries at the same time.
* Once books have been checked out, they can always be checked out again.


Let's open up excel and do a quick mockup of `books` table:


  id |          name        |  description  |
  ---|----------------------|---------------|
   1 | Half Of A Yellow Sun | Biafra War    |
   2 |  Things Fall Apart   | Igbo Culture  |

We will construct a real world example that demonstrates the relation between libraries, books, the genres books fall under and the authors that write the books we love.

> Books are typically written by just one author but some books are written by more than one author. Books also fall into different genres - fiction, romance, autobiography,etc - but some books fit into more than one genre. Library members can find multiple copies of the same library and even in other libraries. This means that though we tend to think about a book as a single copy, in terms of libraries we need to think of books having copies - these copies are then distributed amongst libraries.

One way to approach this problem is to have 2 tables - one that deals solely with books and another that keeps track of all the copies of a book and what library we would find the copies in. The latter is a join table that joins the `Book` model and `Library` models. We will call this join table LibraryBook.

**LibraryBook Model**

```ruby
class LibraryBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :library
end
```

**`library_books` table**

 id | book_id | library_id |
 ---|---------|------------|
  1 |    1    |      1     |
  2 |    1    |      2     |
  3 |    2    |      2     |


Breakdown of `library_books` table:
- Half of a Yellow Sun has an id of 1
- library_books shows that we currently have 2 copies of this book
- One copy of the book is in Walt Whitman Library in Brooklyn (library id = 1)
- Another copy of the book is in Ardsley Library in Ardsley, Westchester (library id = 2)

So Book model has many connections to the LibraryBook model (there are many copies of one book in the table `library_book`. Therefore the model for Book will declare that an instance of a book has many connections to the Library model via the model LibraryBook. The same is true for a library (a library has many books in the `library_books` table). Updated models for County, Member, Book, Library, and LibraryBook:


```ruby

class County < ActiveRecord::Base
  has_many :libraries
  has_many :members
end


class Member < ActiveRecord::Base
  has_many :counties
  has_many :libraries, through: :countries
  has_many :books, through: :libraries
end

class LibraryBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :library
end


class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books
end

class Library < ActiveRecord::Base
  belongs_to :county

  has_many :library_books
  has_many :books, through: :library_books
end
```

So far, neither the `Library` nor `Book` model connects `Member` and `County` models. So lets move on and examine the remaining 2 entities - Authors and Genres.

#####Authors

* Authors have a name (J.K. Rowling, J. D. Salinger, F. Scott Fitzgerald, etc.)
* Authors write at least one book, but usually more. Stephen King has written more than fifty novels including *The Shining*, *Carrie*, and *Pet Sematary*.

Open up excel and create a mockup of the `authors` table:

 id |        name        |
 ---|--------------------|
  1 | Chimamanda Adichie |


`Author` model without any associations:

```ruby
class Author < ActiveRecord::Base
end
```

Neither `authors` table nor `Author` model offers any clue to what book or books an author has written.  Let's examine the table `books` and its corresponding model to find out if a book knows anything about its author.

**`books` table**

  id |          name        |  description  |
  ---|----------------------|---------------|
   1 | Half Of A Yellow Sun | Biafra War    |
   2 |  Things Fall Apart   | Igbo Culture  |

**`Book` model**

```ruby
class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books
end
```

Same thing: Neither `books` table nor `Book` model offers any clue to who the author or authors of a book are. This raises an interesting question: **How does a book know about its author(s) and how does an author know about his/her books?**.

Let's think about this. We need a table that keeps track of both a book and its author(s) - **quick quiz: what do we call this types of tables?**. So far none of our entities offer this capability so it appears that we need to create this **join** table. Here is a mockup of what this table should look like:

 id | book_id | author_id |
 ---|---------|-----------|
  1 |    1    |     1     |


In other to have the columns `book_id` and `author_id`, the corresponding model for the join table would have to declare a `belongs_to` association. Let's call this connecting model `BookAuthor`:

```ruby
class BookAuthor < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
end
```

Next we need to update `Book` and `Author` models:

```ruby
class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :book_authors
  has_many :authors, through: :book_authors
end

class Author < ActiveRecord::Base
  has_many :book_authors
  has_many :books, through: :book_authors
end
```

From associations above, we see that one instance of the `Author` model has many connections to the `Book` model via the a connection `BookAuthor`model. The association between `Author` and `Book` is called a `many-to-many` association.

##### Genres

* Genres have a name (mystery, romance, humor, etc.).
* There isn't just one book that falls in the mystery genre, there are quite a few: *Gone Girl* by Gillian Flynn, *Claire DeWitt and the Bohemian Highway* by Sara Gran, and *The Maltese Falcon* by Dashiell Hammett to name a few.

Open up excel and create a mockup of the `genres` table:

 id |      name      |
 ---|----------------|
  1 |     Fiction    |
  2 |  Non-Fiction   |
  3 | Authobiography |


`Genre` model without any associations:

```ruby
class Genre < ActiveRecord::Base
end
```

Neither `genres` table nor `books` model offers any clue to what genre(s) a book(s) falls under.  Again we have to create a model that connects `Book` model to `Genre` Model. We will call this model `GenreBook` and its corresponding table `genre_books`.

**GenreBook model**

```ruby
class GenreBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :genre
end
```

**`genre_books` table**

 id | genre_id | book_id  |
 ---|---------|-----------|
  1 |    1    |     1     |
  2 |    2    |     1     |

From the above example, we see that `genre_books` helps us identify one book ( with the id of 1) that falls under two different genres (fiction and non-fiction). Update the model's to reflect the new associations.

```ruby
class GenreBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :genre
end

class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :genre_books
  has_many :genres, through: :genre_books
end

class Genre < ActiveRecord::Base
  has_many :genre_books
  has_many :books, through: :genre_books
end
```

#####Checkout

Checkout is the only entity we haven't considered so let's take a look at its requirements:

###### Checkouts
* There is a start date and a due date.
* Members checkout a book.

Here is a mockup of the `checkouts` table:


 id |  start_date  | due_date  |
 ---|--------------|-----------|
  1 |  2015-09-25  | 2015-09-30|


```ruby
class Checkout < ActiveRecord::Base
end
```

Right now neither `Checkout` nor `Book` know how they are associated. To determine what the right association between the two model is, we need to determine which of the following scenarios fits:
- **Does a Checkout belong to a Member?**
- **Does a Member belong to a Checkout?**
- **Does a Checkout have many members?**
- **Does a Member have many checkouts?**

Let's consider a real world scenario:
> As a library member, I can checkout many books. A Librarian should know just by looking at the `checkouts` table which member checked out which book.

Given the about scenario, it appears that `checkouts` table should have a column for `members_id` (used to identify a member) and a column for `book_id` (used to identify the book checked out by a member). Updated with this information, `checkouts` table looks like this:

 id |  start_date  | due_date  |  member_id  |  book_id  |
 ---|--------------|-----------|-------------|-----------|
  1 |  2015-09-25  | 2015-09-30|     1       |    2      |


Next we need to update `Checkout` model so that it reflects this requirement:

```ruby
class Checkout < ActiveRecord::Base
  belongs_to :member
  belongs_to :book
end
```


Now that we have declared association between a checkout, member, and book in `Checkout` model we need to also make sure that `Member` and `Book` models know about their association to the `Checkout` model.

```ruby
class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :genre_books
  has_many :genres, through: :genre_books

  has_many :checkouts
end

class Member < ActiveRecord::Base
  has_many :counties

  has_many :libraries, through: :counties
  has_many :books, through: :libraries

  has_many :checkouts
end
```

**Step 4: Bringing it all together**

Let's take a look at all the associations declared in our Library System thus far:

```ruby
class Library < ActiveRecord::Base
  belongs_to :county

  has_many :library_books
  has_many :books, through: :library_books
end

class LibraryBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :library
end

class Book < ActiveRecord::Base
  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :genre_books
  has_many :genres, through: :genre_books

  has_many :checkouts
end

class BookAuthor < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
end

class Author < ActiveRecord::Base
  has_many :book_authors
   has_many :books, through: :book_authors
end

class GenreBook < ActiveRecord::Base
  belongs_to :genre
  belongs_to :book
end

class Genre < ActiveRecord::Base
  has_many :genre_books
  has_many :books, through: :genre_books
end

class Checkout < ActiveRecord::Base
  belongs_to :book
  belongs_to :member
end

class Member < ActiveRecord::Base
  has_many :counties

  has_many :libraries, through: :counties
  has_many :books, through: :libraries

  has_many :checkouts
end


class County < ActiveRecord::Base
  has_many :libraries
   has_many :books, through: :libraries

   has_many :members
end
```

Looking at the above associations, we notice that one critical association is missing:

- We have a many-to-many association between `Member` and  `County` models

```ruby
class Member < ActiveRecord::Base
  has_many :counties
end

class County < ActiveRecord::Base
  has_many :members
end
```

But we do not have a way to determine the counties that a member is affiliated with  nor have we declared how a county can determine how many members its has. To demonstrate what we mean by this, let's take a look at tables for the `Member` and `County` models:

**`members` table**

  id |   name   |
 ----|----------|
   1 | John Doe |
   2 | Jane Doe |


**`counties` table**

  id  |      name    |
  ----|--------------|
   1  |     Kings    |
   2  |  Westchester |
   3  |  Long Island |


Neither table holds information about the other. Once again we need a third model to connect `Member` and `County` models. Let's call this model `CountryMembership`.

```ruby
class CountyMembership < ActiveRecord::Base
  belongs_to :county
  belongs_to :member
end
```

The `county_membership` table` will look like this:

 id | county_id | member_id |
 ---|-----------|-----------|
  1 |   1       |     1     |
  2 |   2       |     1     |


But we are done! Although we have declared the relationship between `CountyMembership` and `County` and also `CountyMembership` and `Member` models, we haven't linked neither `County` to `CountyMembership` nor `Member` to `CountyMembership`. We need to tell the `Member` model that it needs to proceed through a model called `CountryMembership`:

```ruby
class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships

  has_many :libraries, through: :counties
  has_many :books, through: :libraries

  has_many :checkouts
end
```

We need to also tell `County` to proceed through `CountyMembership` model to find out how many members it has:

```ruby
class County < ActiveRecord::Base
  has_many :libraries
   has_many :books, through: :libraries

   has_many :county_memberships
   has_many :members, through: :country_memberships
end
```
