class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#when working with devise, special parameters may be necessary like this


  has_many :carts
  belongs_to :current_cart, class_name: "Cart"#, foreign_key: "cart_id"


  def create_current_cart
  #  binding.pry
     new_cart = Cart.create(user_id: self.id)
     self.current_cart_id = new_cart.id
     self.save
    self.current_cart.user_id = self.id
    self.save
   end

   def remove_cart
     self.current_cart_id = nil
     save
   end
end



# =>      DATABASE_AUTHENTICABLE
# =>                      This adds a valid_password?(password) method to the model. The password is stored securely in the database.
# =>
# =>      REGISTERABLE
# =>                      Registerable gives you User.new_with_session(params, session), which lets you initialize a User from session data (like a token from Facebook) in addition to params.
# =>
# =>      RECOVERABLE
# =>                      Recoverable gives you password resets, like so:
# =>
# =>                      # resets the user password and save the record, true if valid passwords are given, otherwise false
# =>                                User.find(1).reset_password('password123', 'password123')
# =>
# =>
# =>                      # only resets the user password, without saving the record
# =>                                user = User.find(1)
# =>                                user.reset_password('password123', 'password123')
# =>
# =>
# =>                      # creates a new token and sends it with instructions about how to reset the password
# =>                      # (this one requires a mailer.)
# =>                                User.find(1).send_reset_password_instructions
# =>
# =>      REMEMBERABLE
# =>                      This lets you remember a user and associate them with a User object in the database without them having to log in. It works by storing a token in cookies.
# =>
# =>                                User.find(1).remember_me!  # regenerating the token
# =>                                User.find(1).forget_me!    # clearing the token
# =>
# =>      TRACKABLE
# =>                      Track information about your user's sign-ins. It tracks the following columns:
# =>
# =>                      sign_in_count — Increased every time a user signs in (by form, OpenID, OAuth, etc.)
# =>                      current_sign_in_at — A timestamp updated when the user signs in
# =>                      last_sign_in_at — Holds the timestamp of the previous sign-in
# =>                      current_sign_in_ip — The remote IP updated when the user signs in
# =>                      last_sign_in_ip — Holds the remote IP of the previous sign-in
# =>
# =>
# =>      VALIDATABLE
# =>                      The documentation on this is quite clear:
# =>
# =>                      Validatable creates all needed validations for a user email and password. It's optional, given you may want to create the validations by yourself. Automatically validate if the email is present, unique and its format is valid. Also tests presence of password, confirmation and length.
# =>
# =>      LOCKABLE
# =>                      Handles blocking a user's access after a certain number of attempts. Lockable accepts two different strategies to unlock a user after they're blocked: email and time. The former will send an email to the user when the lock happens, containing a link to unlock their account. The second will unlock the user automatically after some configured time (e.g., two hours). It's also possible to set up Lockable to use both email and time strategies.
# =>
# =>      OMNIAUTHABLE
# =>                      This one doesn't give you a whole lot more than OmniAuth already does. It does set some (but not all!) of the routes for you. That's a nice touch.
