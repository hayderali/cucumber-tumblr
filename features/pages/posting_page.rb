







class PostingPage < GenericPage
    
  def post_only_message
    @browser.div(class: 'editor-richtext').click
    @browser.div(class: 'editor-richtext').send_keys message
  end 
  
  def post_only_title title_message
    @browser.div(class: 'editor-plaintext').click
    @browser.div(class: 'editor-plaintext').send_keys title_message
  end 
  
  def post_no_message_no_title
  
  end 
  
  def verify_dashboard
    @browser.driver.manage.timeouts.implicit_wait = 10 
    #checks user avatar
    expect(@browser.div(class: "post_avatar").a.id).to eq "post_controls_avatar"
  end 
  
  def text_post
      @browser.element(id: "new_post_label_text").click
  end 
  
  def submit
    @browser.button(class: "create_post_button").click
  end

  def only_title checks
    @browser.driver.manage.timeouts.implicit_wait = 10 
    @browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
    @browser.alert.ok
    dashboard_check = @browser.elements(class: "post")
    dashboard_check.each_with_index do |message, post|
      if message.text.match /#{check}/
        puts  "Post #{post+1}: The message exists !!!"
      else  
        puts "Post #{post+1}: The message doesn't exist :("
      end
    end 
  end
  
  
  # def only_message checks
    # @browser.driver.manage.timeouts.implicit_wait = 10
    # @browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
    # @browser.alert.ok
    # dashboard_check = @browser.elements(class: "post")
    # dashboard_check.each_with_index do |message, post|
      # if message.text.match /#{check}/
        # puts  "Post #{post+1}: The message exists !!!"
      # else  
        # puts "Post #{post+1}: The message doesn't exist :("
      # end 
    # end
  # end
  
  # def only_message_verify checks
    # @browser.driver.manage.timeouts.implicit_wait = 10
    # @browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
    # @browser.alert.ok
    # dashboard_check = @browser.elements(class: "post_title")
    # dashboard_check.each_with_index do |message, post|
      # if message.text.match /#{check}/
        # puts  "Post #{post+1}: The message exists !!!"
      # else  
        # puts "Post #{post+1}: The message doesn't exist :("
      # end 
    # end
  # end
  
end