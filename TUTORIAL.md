# Guide To Solving and Reviewing Library Data Modeling

Run rspec, read the error messages and use that to guide your steps.

**When generating tables, make sure to pass the no-test-framework option to your rails generate command `rails generate model ModelName --no-test-framework`**

## Solving the Lab
While in your project directory, run `bundle install` to install all the gems required for this lab. Next create the database by typing `rake db:create` in terminal (make sure you are in the root of the project directory).  Now you are ready to run the tests.  Type `rspec --f-f` and you should have your first error. The first couple of tests are concerned with making sure our tables are set up.

**RSpec Test: uninitialized constants**

  1. Author Constant
    ```ruby
      uninitialized constant Author
    ```

    Our first error should be a clue as to what kind of class is currently missing in our app. Think back to  the  convention for class names in rails (MVC). Class names for Models are singular while class  names for Controllers    and Views are plural.

    Back to our error: `uninitialized constant Author`. Author is singular; therefore we should deduce that we need to  generate an `Author` model. Also, the fact that the failing test is a model test should  point to the fact that we need a model.

    We have 2 choices here:
      - run the `rails generate model Author  --no-test-framework` command
      - manually create a file named `author.rb` in our `app\model` directory and fill it the class details   ourselves.

    The first option - `rails generate model Author` - uses rails templates to create a migration file, a   model file,   and also a spec file for the model. Since we already have a spec file, you need to make   sure to pass `--no-test-framework` option to rails generate model command. If you don't  pick n (for no) when you are asked if you would like to overwrite the existing spec file, the model   specs will be overwritten.

    Although using generators will save you a large amount of time by writing boilerplate code generating the files you need yourself helps you think about the various steps you need to take to make your app work and is very beneficial to your learning. Since we are still beginners, we are going to use the`rails generate` command.

    Make sure you are in your project directory. Now write the following in your terminal:

    ```ruby
      rails generate model Author --no-test-framework
    ```

    In your terminal you should see this:

    ```ruby
    rails generate model Author --no-test-framework
        invoke  active_record
        create    db/migrate/YYYYMMDDHHMMSS_create_authors.rb
        create    app/models/author.rb
    ```
    The command you just typed does two things:
      - first it generates a migration file in your `db/migrate` directory
      - second it generates a corresponding model `Author` that is mapped to the authors table

    Open up the newly created migration file, which should be in `db/migrate` directory should look like  this:

    ```ruby
      class CreateAuthor < ActiveRecord::Migration
        def change
          create_table :authors do |t|
          end
        end
      end
    ```

    This migration adds a table called `authors` to your [database schema](https://en.wikipedia.org/wiki/ Schema_migration). Read this [guide on Active Record Migrations](http://guides.rubyonrails.org/  active_record_migrations.html) to get a better understanding of what is going on.

    Now run `rake db:migrate` to run the migration - that is use the methods in our migration file to create the table. Next run `rspec --f-f` and you should have a new error.

  2. BookAuthor Constant

     The error below:

        ```ruby
          uninitialized constant BookAuthor
        ```

    is practically the same as the first error we encountered.  Like the previous error, it lets us know that   we need a model named `BookAuthor`. Get this test to pass by generating a file for the `BookAuthor`   model class:

     `rails generate model BookAuthor`

     As before, the output in your terminal should indicate that rails generated both a migration to create a `book_authors` table and a corresponding model `BookAuthor`. Once you have confirmed this,   run `rake db:migrate` to create the table. Next run rspec and you should have a new error.

  3. Book Constant

    ```ruby
      uninitialized constant Book
    ```
    Like the previous error, it lets us know that we need a model named `Book`. Get this test to pass by  generating a file for the `Book` model class:

     `rails generate model Book`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `books` table and a corresponding `Book` model.  Once you have confirmed this, run `rake   db:migrate` to create the table. Next run rspec and move on solving the next error.



  4. Checkout Constant

    ```ruby
     uninitialized constant Checkout
    ```

    Like the previous error, it lets us know that we need a model named `Checkout`. Get this test to pass   by generating a file for the `Checkout` model class:

     `rails generate model Checkout`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `checkouts` table and a corresponding `Checkout` model.  Once you have confirmed this, run `rake   db:migrate` to actually create the table. Next run rspec and you should have a new error .

  5. County Constant

    Like the previous error, it lets us know that we need a model named `County`. Get this test to pass   by generating a file for the `County` model class:

     `rails generate model County`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `counties` table and a corresponding `County` model.  Once you have confirmed this, run `rake  db:migrate` and then run `rspec fail-fast`.


  6. GenreBook Constant

    Like the previous error, it lets us know that we need a model named `GenreBook`. Get this test to   pass by generating a file for the `GenreBook` model class:

     `rails generate model GenreBook`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `genre_books` table and a corresponding `GenreBook` model.  Once you have confirmed this, run  `rake db:migrate` to create the table. Next run `rspec --f-f`.

  7. Genre Constant

    Like the previous error, it lets us know that we need a model named `Genre`. Get this test to pass by   generating a file for the `Genre` model class:

     `rails generate model Genre`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `genres` table and a corresponding `Genre` model.  Once you have confirmed this, run `rake   db:migrate` to actually create the table. Next run `rspec --f-f`.

  8. LibraryBook Constant

      Like the previous error, it lets us know that we need a model named `LibraryBook`. Get this test to   pass by generating a file for the `LibraryBook` model class:

     `rails generate model LibraryBook`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `library_books` table and a corresponding `LibraryBook` model.  Once you have confirmed this, run  `rake db:migrate` to actually create the table. Next run `rspec --f-f`.

  9. Library Constant

    Like the previous error, it lets us know that we need a model named `Library`. Get this test to pass by   generating a file for the `Library` model class:

     `rails generate model Library`

    As before, the output in your terminal should indicate that rails generated both a migration to create a  `libraries` table and a corresponding `Library` model.  Once you have confirmed this, run `rake  db:migrate` to actually create the table. Next run `rspec --f-f`.


  10. Member Constant
      Like the previous error, it lets us know that we need a model named `Member`. Get this test to pass   by
      generating a file for the `Member` model class:

     `rails generate model Member`

    As before, the output in your terminal should indicate that rails generated both a migration to create  a   `members` table and a corresponding `Member` model.  Once you have confirmed this, run `rake  db:migrate` to actually create the table. Next run `rspec --f-f`.

    When we run rspec at this point, we see that we have 29 failures. It is best to address each test   individually that is run one test at a time. To   do this, we will run the rspec command and pass it the  `fail fast` option.  In your terminal type:  `rspec --fail-fast`


**RSpec Test: Author has a name**
  Although our failure message tells us that the failing test has to do with an Author not having a name, the key to solving this test actually lies in the following code, which is part of our error message:

  `PG::UndefinedTable: ERROR:  relation "authors" does not exist`

   How do we make the class `Author` have a name? When we create a model that has an attribute or attributes, we need to create a table that keeps track of all the attributes our model has. To do this, we need to create a table. A table is part of an application's database. In rails, we create tables by running the `rails generate migration` command and passing it the options for the columns/attributes for our table.

   For our lab, we need to generate an `authors` table. Since each author has a name attribute, we also need to create a `name` column.  So lets work on getting this test to pass.

   First, we need to generate an `authors` table and we do this by running the following command in our terminal:
   `rails generate migration CreateAuthors`

   After running this command, you should see the below displayed in your terminal:

   ```ruby
    rails g migration CreateAuthors
        invoke  active_record
        create  db/migrate/YYYYMMDDHHMMS_create_authors.rb
   ```

   **NOTE: YYYYMMDDHHMMS stands for YearMonthDayHourMinuteSecond migration file was generated. Those value will differ for you based on when your file was generated**

   Open up the table and take a look at the code that was generated by running that command. Next thing you need to do is to run `rake db:migrate` to create the table `authors`. After running that command, you should see the following in your terminal:

   ```ruby
    rake db:migrate
    == YYYYMMDDHHMMS CreateAuthors: migrating ============
    -- create_table(:authors)
      -> 0.0367s
    == YYYYMMDDHHMMS CreateAuthors: migrated (0.0368s) ============
   ```

  Next we need to add column named `name` to the authors table. To do this, generate another migration that adds the column to the table:

  ```ruby
    rails generate migration AddNameToAuthors
  ```

  Run `rake db:migrate` to add this column to the `authors` table.
  You should see this in your terminal:

  ```ruby
    rails generate migration AddNameToAuthors
      invoke  active_record
      create    db/migrate/YYYYMMDDHHMMS_add_name_to_authors.rb
  ```

  Open up this migration file (look in the `migrate` directory under the `db` directory in your app directory) and add the following under `def change`:

  ```ruby
    class AddNameToAuthors < ActiveRecord::Migration
        def change
          add_column :authors, :name, :string
        end
    end
  ```

  The piece of code you just added to the migration file adds a column `name` that is of the type `string` to the `Authors` table.  Save your changes and run `rspec --fail-fast` in your terminal. Your failing test for name should pass and you should have a new error.

**RSpec Test: Author responds to book_authors method**
  Your next error:

  ```ruby
    Author
        associations
          responds to book_authors method (FAILED - 1)
    Failures:
     1) Author associations responds to book_authors method
  ```

  points to an association between Authors and Books. Going back to the instructions for this lab, we note that:
  - **Authors write at least one book, but usually more. Stephen King has written more than fifty novels including The Shining, Carrie, and Pet Sematary.**

  It appears that Authors usually write more than one book therefore we can conclude that authors have many books. Now we need to figure out the other side of the relationship - how are books related to authors? Again, the instructions tell us that:

  - **Books can have more than one author**

  A book can have more than one author - for example, a book can be co-written by 2 authors - therefore a book sometimes has more more than one author. This points to a [many-to-many relationship](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association).  *Make sure to read that link.*

  **Take a minute to think about what you need to do to make this test pass!!**

  At this point, you hopefully have deduced that you need a join table (called author_books) that keeps track of an author's books and also keeps track of the author(s) of a book.

  ```ruby
    class Author < ActiveRecord::Base
      has_many :book_authors
    end

  ```

  Save your changes and run `rspec --fail-fast`

**RSpec Test: Author responds to book method**
  Your next error:

  ```ruby
    Author
        connection to book model
          responds to book method (FAILED - 1)
    Failures:
     1) Author connection responds to books method
  ```

  Should have you thinking about how the `Author` model is connected to the `Book` model. Take the time to read [this link](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association) again before proceeding to the solution below.

  `Author` has_many books through book_authors:

  ```ruby
    class Author < ActiveRecord::Base
      has_many :book_authors
      has_many :books, through: :book_authors
    end
  ```

  If you still don't understand the relationships, don't sweat it -   associations in rails takes some getting used to.


**RSpec Test: BookAuthor model responds to book method**
  The next error:

  ```ruby
    unknown attribute 'title' for Book.
  ```
  requires you to add a column of the type `string` to the books table. Generate a migration for this by typing the command below in your terminal:

  `rails generate migration AddTitleToBooks title:string`

  after that, run `rake db:migrate RAILS_ENV=test` and then run rspec again.  You should see this error:

  ```ruby
    unknown attribute 'description' for Book
  ```

  requires you to add a column of the type `text` to the books table. Read this [stackoverflow question and its corresponding answers](http://stackoverflow.com/questions/3354330/difference-between-string-and-text-in-rails) to grasp the difference between `string` and `text` in Rails. Generate a migration for this by typing the command below in your terminal:

  `rails generate migration AddDescriptionToBooks description:text`


  after that, run `rake db:migrate RAILS_ENV=test` and then run rspec again. You should see this error:

  ```ruby
    unknown attribute 'book_id' for BookAuthor
  ```

  To understand the above error, read the documentation on [belongs_to](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association) and its relationship to [has_many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association). Once you are done reading those links, generate a migration that adds the `book_id` column  to the `BookAuthor` model:

  `rails generate migration AddBookIdToBookAuthors book:references`

  run `rake db:migrate RAILS_ENV=test` and then run rspec again. You should see this error:

  ```ruby
    unknown attribute 'author_id' for BookAuthor
  ```

  Once again, generate a migration that adds the `author_id` column  to the `BookAuthor` model:

    `rails generate migration AddAuthorIDToBookAuthors author:references`

  run `rake db:migrate RAILS_ENV=test` and then run rspec again. You should see this error:

  ```ruby
    expected #<BookAuthor id: 1, created_at: "2015-10-20 21:10:10", updated_at: "2015-10-20 21:10:10", author_id: 4, book_id: 1> to respond to :book
  ```

  What? Well let's think about this for a min. We have added the right attributes to our join table  (`bookauthors`) but we have not declared the right associations in the `BookAuthor` model.  So open up the right model file and declare that each instance of our `BookAuthor` model belongs to another instance of our `Book` model.

  ```ruby
    class BookAuthor < ActiveRecord::Base
      belongs_to :book
    end
  ```

  Save your changes and run rspec. Your test should pass.


**RSpec Test: BookAuthor model responds to author method**

  This should feel familiar to you now. Think of what association needs to be declared in the `BookAuthor` model. Open up the model file and declare a belongs_to association between each instance of the join table `author_books` and each instance of the `Author` class:

  ```ruby
    class BookAuthor < ActiveRecord::Base
        belongs_to :book
        belongs_to :author
    end
  ```

  Save the changes and run `rspec --fail-fast`.  Your test should pass now!


**RSpec Test: Book responds to genre_books**
  This error:

  ```ruby
  Book
    connection to genre model
        responds to genre_books method (FAILED - 1)
  ```

  should be familiar to you.  Like the `BookAuthor` model, this error points to an association between the `Book` model and the `GenreBook` model.  Following the steps explained earlier (see `BookAuthor` model and its associated models), declare the right associations in the `Book` model.

  ```ruby
    class Book < ActiveRecord::Base
        has_many :book_authors
        has_many :authors, through: :book_authors

        has_many :genre_books
        has_many :genres, through: :genre_books

    end
  ```

  save your changes and run rspec. You should have a new error.


**RSpec Test: Book responds to library_books**

  ```ruby
    Book
      connection to library model
          responds to library_books method (FAILED - 1)
Failures:
  1) Book connection to library model responds to library_books method
     Failure/Error: expect(book).to respond_to(:library_books)
       expected #<Book .."> to respond to :library_books

  ```

  points to an association between `Book` and `LibraryBook` models.  Going back to the instructions for this lab, we note that:

  - **The same book (title) can live in many libraries at the same time**

  It appears that Books have multiple copies and these copies live in different libraries. Now we need to figure out the other side of the relationship - how are libraries related to books? Again, the instructions tell us that:

  - **Libraries hold a ton of books, not just one.**

  So one instance of the `Library` model has many books. This points to a [many-to-many relationship](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association).  *Make sure to read that link.*


  **Take a minute to think about what you need to do to make this test pass. Think back to the relationship between an author and a book. Try to map out the right assoiciations before moving on to the solution below**

  At this point you might have deduced that you have a join table called `library_books`. So now we need to declare the right relationships in our models:

  ```ruby

    class Book < ActiveRecord::Base
        has_many :book_authors
        has_many :authors, through: :book_authors

        has_many :genre_books
        has_many :genres, through: :genre_books

        has_many :library_books
        has_many :libraries, through: :library_books
    end

    class Library < ActiveRecord::Base
      belongs_to :book
      belongs_to :library
    end

    class LibraryBook < ActiveRecord::Base
      has_many :library_books
      has_many :books, through: :library_books
    end
  ```

save your changes, run rspec, and you should have a new error.

**RSpec Test: Book responds to checkout method**
This error:

```ruby
    Book
    connection to checkout model
      responds to checkout method(FAILED -1)
```

This error points to an association between the `Book` model and the `Checkout` model.  To figure out what type of association this is we will refer to the **instructions** section of the lab. Here we find that:

  - Once books have been checked out, they can always be checked out again
On the other end of the association, Checkout's don't seem to have a direction relationship to books. For now, we will declare the one association that we know for sure, which is that books have many checkouts. so open up the `Book` model and declare that association:

```ruby
  class Book < ActiveRecord::Base
    has_many :book_authors
      has_many :authors, through: :book_authors

      has_many :genre_books
      has_many :genres, through: :genre_books

      has_many :library_books
      has_many :libraries, through :library_books

      has_many :checkouts
  end
```

Save the new changes and run `rspec --f-f`.

**RSpec Test: Checkout has a start_date**

Our next error:

```ruby
  Checkout
      has a start_date (FAILED - 1)
      ActiveRecord::UnknownAttributeError:
       unknown attribute 'start_date' for Checkout
```

lets us know that our checkouts table does not have the attribute/column start_date on it. To add this column to the table, we need to generate a migration that adds a column of the type `date` to the checkouts table. Type the following command in your terminal:

```ruby
  rails generate migration AddStartDateToCheckout start_date:date
```

Open up the migration file that was generated by the above command and you should see this:

```ruby
class AddStartDateToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :start_date, :date
  end
end
```

Now run `rake db:migrate` followed by `rspec --f-f`. Your next error:

```ruby
  ActiveRecord::UnknownAttributeError:
       unknown attribute 'date_returned' for Checkout
```

points to the fact that the design of our checkouts table isn't complete; we need to add another column for `date_returned` to the table. Type the following command in your terminal:

```ruby
  rails generate migration AddDateReturnedToCheckout date_returned:date
```

Inspect the migration file generated and you should see this:

```ruby
class AddDateReturnedToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :date_returned, :date
  end
end
```

Now run `rake db:migrate` followed by `rspec --f-f`. The next error:

```ruby
ActiveRecord::UnknownAttributeError:
       unknown attribute 'book_id' for Checkout
```

indicates that we need to add yet another column to the checkouts table. So lets do so:

```ruby
  rails generate migration AddBookIdToCheckouts book:references
```

run `rake db:migrate` followed by `rspec --f-f` again.


**RSpec Test: Checkout responds to book method**

This error:

```ruby
  Checkout
    connection to book model
      responds to book method (FAILED - 1)
```

tells us that the `Checkout` model is missing its association to the `Book` model. We already know that a each instance of a book can be checked out more than once  - that is a book has multiple checkouts. The question to ask ourselves now is: Can a checkout have many books? Think of it: When you checkout a book at library, the Librarian only scans a book once to indicate that it has been checkout out, right? Following this logic, we can therefore deduce that a checkout `belongs_to` to a book. Adding this relationship to the `Checkout` enables us to query the checkouts table to determine what book was checked out.

```ruby
  book_checked_out = checkout.book
```

Modify the `Checkout` model to look like this:

```ruby
  class Checkout < ActiveRecord::Base
    belongs_to :book
  end
```

Save your changes and run `rspec --f-f`.

**RSpec Test: County has a name**

You should recognize what step to take to fix the next error:

```ruby
  County
      has a name (FAILED - 1)
        ActiveRecord::UnknownAttributeError:
          unknown attribute 'name' for County.
```

An unknown attribute typically means that you are trying to pass in an attribute that a table does not recognize. Here the data in out test is trying to create a new county and passing in the name of the county.

The instructions in this lab tell us that a county has a name, have a few libraries in them, and also have many library members. So first we are going to generate a migration file that adds a name column of the type `string` to the country table:

```ruby
  rails generate migration AddNameToCounties name:string
```

run ``rake db:migrate` and then run `rspec --f-f`.

**RSpec Test: County responds to libraries method**

The next error:

```ruby
County
  connection to library model
    responds to libraries method (FAILED - 1)

    1) County connection to library model responds to libraries method
     Failure/Error: expect(county).to respond_to(:libraries)
       expected #<County id: 2, created_at: "2015-10-21 21:05:33", updated_at: "2015-10-21 21:05:33", name: "Kings County"> to respond to :libraries

```

Points us in the direction of figuring out the relationship between the `County` and `Library` models.  From the instructions in the lab, we know that:

- Libraries are located in a specific county

Since a Library has be located in a specific county, it cannot have more than one county. This leaves us two associations to consider `belongs_to` or `has_one`.  In this case, it makes more sense to think of a library belonging to a county so we will declare that association in the `Library` model.

```ruby
class Library < ActiveRecord::Base
  belongs_to :county

  has_many :library_books
  has_many :books, through: :library_books
end
```

Next the instructions tell us that:

- Counties have a few libraries in them. For instance, in Denver, CO there is large, centrally located library called the Denver Public Library and several smaller ones (Byers Branch Library, Ford-Warren Branch Library, etc.)

The above indicates a has_many association between `County` and `Library` - that is a county has many libraries in it. So lets open up the county model and declare that relationship:

```ruby
class County < ActiveRecord::Base
  has_many :libraries
end
```

While we are here, lets stop to think about what else a county has now that it can access a library instance.  Looking at the `Library` class:

```ruby
class Library < ActiveRecord::Base
  belongs_to :county

  has_many :library_books
  has_many :books, through: :library_books
end
```

We know that each instance of the `Library` class has many books. Since each instance of the `County` has many libraries, each instance of those library will have many books. There it makes sense that each instance of the `County` model will have many_books via its association with libraries. So go ahead and update the `County` model to reflect this:

```ruby
class County < ActiveRecord::Base
  has_many :libraries

  has_many :books, through: :libraries
end
```

Save these changes and run `rspec --f-f`.

**RSpec Test: County responds to members method**
The next error:

```ruby
County
  connection to member model
    responds to members method (FAILED - 1)

Failures:

  1) County connection to member model responds to members method
     Failure/Error: expect(county).to respond_to(:members)
       expected #<County id: 5, created_at: "2015-10-21 21:23:27", updated_at: "2015-10-21 21:23:27", name: "Kings County"> to respond to :members
     # ./spec/models/county_spec.rb:18:in `block (3 levels) in <top (required)>'
```

directs to take a look at the relationship between the `County` and `Member` models. The instructions in the lab inform us that:

- Members can have more than one county

How can a member have more than one county? Well, let's consider the scenario for a second.  I live in New York and have 2 library cards. One for Brooklyn, which is in Kings County; and another for Coram, which Suffolk County. So it appears that members have many counties. So let's declare that association in the `Member` model:

```ruby
class Member < ActiveRecord::Base
  has_many :counties
end
```

From the instructions, we also know that:

- Counties have many library members

Therefore we can conclude that counties have many members. We declare this association in the `County` model:


```ruby
class County < ActiveRecord::Base
  has_many :libraries
  has_many :books, through: :libraries
  has_many :members
end
```

But we are done! Although we have declared the relationship between these two models (`County` and `Member`) we haven't linked them together - that is we haven't told a member how it has many counties neither have we told a county how it has many members. This is a many_to_many relationship and as such we need a join table that will help us keep track of this relationship. Let's call this join table county_memberships. Next we need to change the associations in our table so that our models (`County` and `Member`) know how they are related to each other:

```ruby
class County < ActiveRecord::Base
  has_many :libraries
  has_many :books, through: :libraries

  has_many :county_memberships
  has_many :members, through: :county_memberships
end
```

```ruby
class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :country_memberships
end
```
CountyMembership is a new table so we need to generate a model and its associated migration for it.

```ruby
  rails generate model CountyMembership county:references member:references
```
This command will generate a `CountyMembership` model that looks like this:

```ruby
class CountyMembership < ActiveRecord::Base
  belongs_to :county
  belongs_to :member
end
```

Now run `rake db:migrate` and ``rspec --f-f`.


**Rspec Test: GenreBook responds to book method**
The next error:

```ruby
GenreBook
  connection to book model
    responds to book method (FAILED - 1)

Failures:

  1) GenreBook connection to book model responds to book method
     Failure/Error: let(:genre) {Genre.create(:name => "Fiction")}
     ActiveRecord::UnknownAttributeError:
       unknown attribute 'name' for Genre.
```

indicates that the `genres` table is missing the name attribute. Generate a migration to fix the error:

`rails generate migration AddNameToGenres name:title`

run `rake db:migrate` followed by `rspec --f-f`.  The next error:

```ruby
ActiveRecord::UnknownAttributeError:
       unknown attribute 'book_id' for GenreBook
```

indicates that we need to add a `book_id` column to `genre_books` table so let's generate a migration for that:

`rails generate migration AddBookIdToGenreBooks book:references`

run `rake db:migrate` followed by `rspec --f-f` again.  The next error indicates that we need to add `genre_id` to `genre_books` table so let's generate another migration:

`rails generate migration AddGenreIdToGenreBooks`

run `rake db:migrate` followed by `rspec --f-f` again.  The next error:

```ruby
GenreBook
  connection to book model
    responds to book method (FAILED - 1)

Failures:

  1) GenreBook connection to book model responds to book method
     Failure/Error: expect(genre_book).to respond_to(:book)
       expected #<GenreBook id: 1, created_at: "2015-10-21 22:28:25", updated_at: "2015-10-21 22:28:25", book_id: 15, genre_id: 1> to respond to :book
```

indicates that we need to add the macro `book=` to the `GenreBook` model. Looking at the model tests for `GenreBook`, we notice it knows about both book_id and author_id:

```ruby
expected #<GenreBook id: 1, created_at: "2015-10-21 22:28:25", updated_at: "2015-10-21 22:28:25", book_id: 15, genre_id: 1> to respond to :book
```
From this we can conclude that `genre_books` is a join table that keeps track of the association between the `Genre` and `Book` models. Modify the `GenreBook` model to reflect this association:

```ruby
class GenreBook < ActiveRecord::Base
  belongs_to :genre
  belongs_to :book
end
```

save the changes and run `rspec --f-f`.

**RSpec Test: Genre responds to genre_books method**

The next error:

```ruby
Genre
  its attributes
    has a name
  connection to book model
    responds to genre_books method (FAILED - 1)

Failures:

  1) Genre connection to book model responds to genre_books method
     Failure/Error: expect(genre).to respond_to(:genre_books)
       expected #<Genre id: 8, created_at: "2015-10-21 22:38:35", updated_at: "2015-10-21 22:38:35", name: "Fiction"> to respond to :genre_books
```

indicates that we need to tell the `Genre` model about its association to the `GenreBook` model. Since `GenreBook` declares a belongs_to association to `Genre`, we know that `Genre` has to `have_many genre_books` and also has to `have_many :books`.  So let's fix this in the model:

```ruby
class Genre < ActiveRecord::Base
  has_many :genre_books
  has_many :books, through: :genre_books
end
```

save the new changes and run `rspec --f-f`


**RSpec Test: LibraryBook responds to books method**
The next error:

```ruby
LibraryBook
  connection to book model
    responds to book method (FAILED - 1)

Failures:

  1) LibraryBook connection to book model responds to book method
     Failure/Error: let(:library) {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}
     ActiveRecord::UnknownAttributeError:
       unknown attribute 'name' for Library
```

indicates that we are missing a column in the `libraries` table.  Let's take a minute and find out all the attributes of a Library so that we can generate one migration that adds all the necessary columns.  The lab instructions tell us that:

- Libraries have an address.
- Libraries have a name.

So our rails generate migration command looks like this:

`rails generate migration AddAddressAndNameToLibraryBooks address:string name:string`

next, run `rspec --f-f` again and the next error:

```ruby
LibraryBook
  connection to book model
    responds to book method (FAILED - 1)

Failures:

  1) LibraryBook connection to book model responds to book method
     Failure/Error: let(:library_book) {LibraryBook.create(:book_id => book.id, :library_id => library.id)}
     ActiveRecord::UnknownAttributeError:
       unknown attribute 'book_id' for LibraryBook.
```

lets us know that we need to add a `book_id` column to the join table `libary_books`.  By now we know that we need to add a column for `library_id` too, so lets generate one migration that adds both columns:

`rails generate migration AddBookIdAndLibraryIDToLibraries book:references library:references`

run `rake db:migrate` and then `rspec --f-f`

**RSpec Test: Member has a name**

The next error:

```ruby
Member
  has a name (FAILED - 1)

Failures:

  1) Member has a name
     Failure/Error: let(:member) {Member.create(:name => "Uzo Aduba")}
     ActiveRecord::UnknownAttributeError:
       unknown attribute 'name' for Member
```

indicates that the `members` table needs a column for the name attribute, so lets generate a migration for that:

`rails generate migration AddNameToMembers name:string`

run `rake db:migrate` and then `rspec --f-f`.


**RSpec Test: Member responds to libraries method**

The next error:

```ruby
Member
  connection to library model
    responds to libraries method (FAILED - 1)

Failures:

  1) Member connection to library model responds to libraries method
     Failure/Error: expect(member).to respond_to(:libraries)
       expected #<Member id: 3, created_at: "2015-10-22 00:02:30", updated_at: "2015-10-22 00:02:30", name: "Uzo Aduba"> to respond to :libraries
```
indicates that we need to tell the `Member` model about its association with the `Library` model. Currently, the `Member` model has the following associations:

```ruby
class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships
end
```

Recall that `County` has the following associations:

```ruby
class County < ActiveRecord::Base
  has_many :libraries
  has_many :books, through: :libraries

  has_many :county_memberships
  has_many :members, through: :county_memberships
end
```

Since a county has many libraries and members have many counties, it follows that a member has many libraries through its association with counties. So let's update the `Model` model to reflect this:

```ruby
class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships

  has_many :libraries, through: :counties
end
```

Save the change and then `rspec --f-f`

**RSpec Test: Member responds to checkouts method**

The next error:

```ruby
Member
  connection to checkout model
    responds to checkouts method (FAILED - 1)

Failures:

  1) Member connection to checkout model responds to checkouts method
     Failure/Error: expect(member).to respond_to(:checkouts)
       expected #<Member id: 7, created_at: "2015-10-22 13:53:51", updated_at: "2015-10-22 13:53:51", name: "Uzo Aduba"> to respond to :checkouts
```

requires us to figure out the association between the `Model` and `Checkout` models. Recall that a book has many checkouts and that a library has many books. Since a member has many libraries, and a library has many books, it follows that a member has many books through its association with a library and thus a member will be able to checkout all the various books in that any county library - that is a member has many checkouts.  Update the `Member` model to reflect this:

```ruby
class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships

  has_many :libraries, through: :counties
  has_many :books, through: :libraries
  has_many :checkouts, through: :books
end
```

save the changes, run `rspec --f-` and .... watch all the tests pass :)
