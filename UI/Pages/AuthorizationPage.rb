require_relative '../Utils/Console'
require_relative '../../Database/Repositories/UserRepository'

class AuthorizationPage
  include Console

  def initialize
    @user_repository = UserRepository.new
  end

  LOGIN = "1"
  REGISTER = "2"
  EXIT = "3"

  def open
    puts "Hello, you're not logged in to app, please select one of the options below (numbers):"
    puts "1. Login"
    puts "2. Register"
    puts "3. Exit App"

    print 'Enter your choice: '
    action = get_action_from_user

    clear
    case action
      when LOGIN
        show_login_instructions
      when REGISTER
        show_register_instructions
      when EXIT
        show_exit_message
        return
      else
        throw Exception('Unreachable action was executed')
    end
  end

  def get_action_from_user
    loop do
      action_input = gets.chomp

      if is_valid_choice?(action_input)
        return action_input
      end
    end
  end

  def is_valid_choice?(choice)
    choice == LOGIN || choice == REGISTER || choice == EXIT
  end

  def show_login_instructions
    is_correct_credentials = false
    until is_correct_credentials
      puts 'Enter your username'
      username = gets.chomp
      puts 'Enter your password'
      password = gets.chomp
      clear

      user = @user_repository.find(username)
      is_correct_credentials = user && user.password == password
      unless is_correct_credentials
        puts 'Incorrect credentials, try again!'
      end
    end

    puts 'Logged in successfully'
  end

  def show_register_instructions
    is_correct_credentials = false
    until is_correct_credentials
      puts 'Enter username'
      username = gets.chomp
      puts 'Enter password'
      password = gets.chomp
      clear

      is_correct_credentials = @user_repository.create(username: username, password: password)
      unless is_correct_credentials
        puts 'User already exists, try again!'
      end
    end

    puts 'Registered successfully'
  end

  def show_exit_message
    puts 'Exited successfully. Thanks for using the app!'
  end
end