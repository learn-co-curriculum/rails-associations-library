# Guide To Solving and Reviewing Library Data Modeling

Run rspec, read the error messages and use that to guide your steps.

**When generating tables, make sure to pass the no-test-framework option to your rails generate command `rails generate model ModelName --no-test-framework`**

## Solving the Lab
-  **RSpec Test 1: uninitialized constants**
  1. Author Constant
    The first test is concerned with making sure we have our tables are set     up.

    The first error `uninitialized constant Author` should be a clue as to    what kind of class is currently missing in our app. Think back to the     convention for class names in rails (MVC). Class names for Models are     singular while class names for Controllers and Views are plural.

    Back to our error: `uninitialized constant Author`. Author is singular;     therefore we should deduce that we need to generate an `Author` model.    Also, the fact   that the failing test is a model test should also    be another clue.

    We have 2 choices here:
      - run the `rails generate model Author  --no-test-framework` command
      - manually create a file named `author.rb` in our `app\model` directory     and fill it the class details ourselves.

      The first option - `rails generate model Author` - uses templates to    create a migration file, a model file, and also a spec file for the     model. Since we  already have a spec file, you need to make sure to pass    `--no-test-framework` option to rails generate model command. If you    don't, pick n (for no), when you are asked if you would like to overwrite     the existing spec file, the model specs will be overwritten.

      Although using generators will save you a large amount of time by writing       boilerplate code, generating the files you need yourself helps you think      about the various steps you need to take to make your app work and is     very beneficial to your learning.

      Since we are still beginners, we are going to manually generate our own       files.

      Make sure you are in your project directory. Now write the following in     your terminal:

      ```ruby
      touch app/models/author.rb
      ```

      If we run rspec at this point we get the following error message:

      ```ruby
        Unable to autoload constant Author,
        expected .../rails-associations-library/app/models/author.rb
        to define it (LoadError)
      ```

      To solve this error, open up the `author.rb` file, which you just     generated, and define the `Author` class like this:

      ```ruby
        class Author < ActiveRecord::Base
        end
      ```

      When we run rspec now, we get another error.

    2. BookAuthor Constant

       ```ruby
        uninitialized constant BookAuthor
      ```

      This test requires a model named `BookAuthor`. Get this test to pass by     generating a file for the `BookAuthor` class:

      `touch app/models/book_author.rb`

      If we run rspec at this point we get the following error message:

      ```ruby
        Unable to autoload constant BookAuthor,
        expected .../rails-associations-library/app/models/book_author.rb
        to define it (LoadError)
      ```

      To get rid of the above error, define a class `BookGenre` that inherits     from ActiveRecord::Base.

      ```ruby
      class BookAuthor < ActiveRecord::Base
      end
      ```

      Save your file, run rspec, and you should see another error.

    3. Book Constant

    ```ruby
        uninitialized constant Book
      ```

      You should recognize this error - think back to the first two rspec     errors. This test requires a model named `Book`. To get     this test to pass, generate a file for the `Book` class by running the    following command in your terminal (make sure you are in the right    project directory):

      `touch app/models/book.rb`

      Next, define the class `Book` and ensure that it inherits from      ActiveRecord::Base. Open up the newly created `book.rb` file and write    the  following:

      ```ruby
        class Book < ActiveRecord::Base
        end
      ```



  4. Checkout Constant
     This test requires a model named `Checkout`. To get this test to pass,     generate a file for the `Checkout` class by running the following command     in your terminal (make sure you are in the right project directory):

    `touch app/models/checkout.rb`

      Next, we need to define the class `Checkout` and ensure that it inherits      from ActiveRecord::Base. Open up the newly created `checkout.rb` file and       write the following:

      ```ruby
        class Checkout < ActiveRecord::Base
        end
      ```

    5. County Constant
      This test requires a model named `County`. To get this test to pass,      generate a file for the `county` class by running the following command     in  your terminal (make sure you are in the right project directory):

      `touch app/models/county.rb`

      Next, we need to define the class `country` and ensure that it inherits       from ActiveRecord::Base. Open up the newly created `county.rb` file and       write the following:

      ```ruby
      class County < ActiveRecord::Base
      end
      ```

    6. Genre Constant
      This test requires a model named `Genre`. To get this test to pass,       generate a file for the `Genre` class by running the following command in       your terminal (make sure you are in the right project directory):

      `touch app/models/genre.rb`

      Next, we need to define the class `Checkout` and ensure that it inherits      from ActiveRecord::Base. Open up the newly created `genre.rb` file and      write the following:

      ```ruby
      class Genre < ActiveRecord::Base
      end
      ```

    7. LibraryBook Constant
      This test requires a model named `LibraryBook`. To get this test to pass,       generate a file for the `LibraryBook` class by running the following    command in your terminal (make sure you are in the right project    directory):

      `touch app/models/library_book.rb`

      Next, we need to define the class `LibraryBook` and ensure that it    inherits from ActiveRecord::Base. Open up the newly created     `library_book.rb` file and write the following:

      ```ruby
        class LibraryBook < ActiveRecord::Base
        end
      ```




    When we run rspec at this point, we see that we have 29 failures. It is   best to address each test individually - that is run one test at a time. To   do this, we will run the rspec command and pass it the `fail fast` option.  In your terminal type:  `rspec --fail-fast`

- **RSpec Test 2: Author has a name (FAILED - 1)**
  Although our failure message tells us that the failing test has to do with an Author not having a name, the key to solving this test actually lies in the following code, which is part of our error message:

  `PG::UndefinedTable: ERROR:  relation "authors" does not exist`

  *Insert Brief spill about ORMS and ActiveRecord*

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

- **RSpec Test 3: Author responds to book_authors method**
  Your next error:

  ```ruby
    Author
        associations
          responds to book_authors method (FAILED - 1)
    Failures:
     1) Author associations responds to book_authors method
  ```

  points to an association between Authors and Books. Going back to the instructions for this lab, we note that:
  - **Authors write at least one book, but usually more. Stephen King has     written more than fifty novels including The Shining, Carrie, and Pet     Sematary.**

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

- **RSpec Test 4: Author responds to book method**
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


- **RSpec Test 5: BookAuthor model responds to book method**
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


- **RSpec Test 6: BookAuthor model responds to author method**

  This should feel familiar to you now. Think of what association needs to be declared in the `BookAuthor` model. Open up the model file and declare a belongs_to association between each instance of the join table `author_books` and each instance of the `Author` class:

  ```ruby
    class BookAuthor < ActiveRecord::Base
        belongs_to :book
        belongs_to :author
    end
  ```

  Save the changes and run `rspec --fail-fast`.  Your test should pass now!

