require "active_record"
require_relative "db_helper/version"

module DbHelper
  class << self
    def adapter
      ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    end

    def table_exists?(table_name)
      ActiveRecord::Base.connection.data_source_exists?(table_name)
    end

    def create_table(table_name, columns = {})
      return if table_exists?(table_name)

      ActiveRecord::Base.connection.create_table(table_name) do |t|
        columns.each do |col, type|
          t.column col, type
        end
        t.timestamps
      end
    end

    def dynamic_insert(table_name, data)
      raise "Table doesn't exist" unless table_exists?(table_name)
      raise "Data must be a hash" unless data.is_a?(Hash)

      # Using Arel to build query (for better compatibility)
      model_class = Class.new(ActiveRecord::Base) do
        self.table_name = table_name
      end

      model_class.create!(data)
    end

    def current_database
      ActiveRecord::Base.connection.current_database
    end
  end
end
