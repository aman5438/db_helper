 Installation
 Add this line to your application's Gemfile:
 gem 'db_helper', git: 'https://github.com/yourname/db_helper' # or use gem version if published

then run
bundle install
or install manually
gem install db_helper

Usage
1. Check Adapter Type
  DbHelper.adapter
  # => :sqlite3 or :mysql2 or :postgresql
2. Check if a Table Exists
  DbHelper.table_exists?("users")
  # => true or false
3. Create a Table (if it doesn't exist)
  DbHelper.create_table("users", {
    name: :string,
    email: :string
  })
  This will create a users table with name, email, and timestamps.

4. Insert Data Dynamically
  DbHelper.dynamic_insert("users", {
    name: "John Doe",
    email: "john@example.com"
  })
  The table must exist before inserting.

5. Get Current Database Name
  DbHelper.current_database
  # => "db_helper_test" or ":memory:" etc.

Testing the Gem
To run tests:
  bundle exec rspec
Use environment variables to test with different databases:
  DB_ADAPTER=mysql2 DATABASE_NAME=db_helper_test USERNAME=root PASSWORD=root bundle exec rspec

Directory Structure
  db_helper/
  ├── lib/
  │   ├── db_helper.rb
  │   └── db_helper/version.rb
  ├── spec/
  │   └── db_helper_spec.rb
  ├── db_helper.gemspec
  └── README.md
  
Future Improvements
Add support for schema migrations

Support validations on dynamic inserts

Add more DB introspection helpers

👤 Author
Aman Agrawal