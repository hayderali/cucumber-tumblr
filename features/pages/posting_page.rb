







class PostingPage < GenericPage
    
  def visit
    @browser.goto LOC
  end
  
 
  def post_only_message
  
  end 
  
  def post_only_title 
  
  end 
  
  def post_no_message_no_title
  
  end 
  
  
  def submit
    @browser.button(class: "create_post_button").click
  end

end