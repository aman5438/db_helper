require "spec_helper"
require "db_helper"
require 'pry'

RSpec.describe DbHelper do
  let(:table_name) {"test_users"}

  it "has a version number" do
    expect(DbHelper::VERSION).not_to be nil
  end

  describe '.adapter' do
    it "return the adapter name as symbol" do
      expect(DbHelper.adapter).to eq(:mysql2)
    end
  end

  describe '.table_exists?' do
    it "it return false if table not exists" do
      expect(DbHelper.table_exists?(table_name)).to be false
    end
  end

  describe '.create_table' do
    it 'creates a table with given columns' do
      DbHelper.create_table(table_name, name: :string, age: :integer)
      expect(DbHelper.table_exists?(table_name)).to be true
    end
  end

  describe '.dynamic_insert' do
    before do
      DbHelper.create_table(table_name, name: :string, age: :string)
    end

    it 'inserts a row into the table' do
      expect {
        DbHelper.dynamic_insert(table_name, {name: "aman", age: "26"}) 
      }.to change{
        ActiveRecord::Base.connection.execute("select count(*) from #{table_name}").first
      }.by([1])
    end

    it "raises error if table doesn't exist" do
      expect{
        DbHelper.dynamic_insert("tessasdat", {name: "xx"})
      }.to raise_error("Table doesn't exist")
    end

    it "raises error if data is not a hash" do
      expect {
        DbHelper.dynamic_insert(table_name, ["not", "a", "hash"])
      }.to raise_error("Data must be a hash")
    end
  end

  describe '.current_database' do
    it 'return current_database name' do
      expect(DbHelper.current_database).to eq("db_helper_test")
    end
  end
end