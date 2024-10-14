require 'active_record'

def setup_db
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './Data/library_system.db'
  )
end

def run_library_app
  setup_db
end

run_library_app