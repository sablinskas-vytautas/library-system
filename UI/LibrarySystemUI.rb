require_relative 'Pages/AuthorizationPage'

class LibrarySystemUI
  def show_ui
    AuthorizationPage.new.open
  end
end