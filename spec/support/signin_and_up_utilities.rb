  def valid_signin(user)
    fill_in "Email",    with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  def sign_in(user, options={})
    if options[:no_capybara]
      # Sign in when not using Capybara
      remember_token = User.new_token
      cookies[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.hash(remember_token))
    else
      #click_link "Sign out" if signed_in?
      visit signin_path
      valid_signin(user)
    end
  end

  def valid_signup
    fill_in "Name",             with: "Example User"
    fill_in "Email",            with: "user@example.com"
    fill_in "Password",         with: "foobar"
    fill_in "Confirm password", with: "foobar"
  end

