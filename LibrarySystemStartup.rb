require 'active_record'
require_relative 'UI/LibrarySystemUI'

def setup_db_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './Data/library_system.db'
  )
end

def start_ui
  library_system = LibrarySystemUI.new
  library_system.show_ui
end

def run_library_app
  setup_db_connection
  start_ui
end

run_library_app