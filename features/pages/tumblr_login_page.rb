







class TumblrLoginPage < GenericPage
  LOC = "www.tumblr.com/login"
    
  def visit
    @browser.goto LOC
  end
  
  
  def login_field
    @browser.text_field(id: "signup_email").set "hayder.ali92@gmail.com" 
    @browser.text_field(id: "signup_password").set "banana11"
  end 
  
  def submit
    @browser.button(id: "signup_forms_submit").click
  end
end