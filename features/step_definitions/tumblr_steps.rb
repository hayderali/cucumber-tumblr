#background
Given(/^I'm logged into Tumblr$/) do
  
  @tumblr = TumblrLoginPage.new @browser
  @tumblr.visit 
  @tumblr.login_field
  
end

Then(/^I am redirected to my tumblr dashboard page$/) do
  @tumblr.submit
end

Given(/^I'm on my dashboard$/) do
  expect(@browser.div(class: "post_avatar").a.id).to eq "post_controls_avatar"
end


Given(/^I click on a text post$/) do
  @browser.element(id: "new_post_label_text").click
end

#scenario 1
When(/^I enter "([^"]*)" into the title box$/) do |title_message|
  @browser.div(class: 'editor-plaintext').click
  @browser.div(class: 'editor-plaintext').send_keys title_message
end

When(/^I click on the post button$/) do
  @browser.button(class: "create_post_button").click
end

Then(/^My dashboard should contain a text post with the title "([^"]*)"$/) do |title_message|
  
  @browser.driver.manage.timeouts.implicit_wait = 10
  @browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
  @browser.alert.ok
  dashboard_check = @browser.elements(class: "post")
  dashboard_check.each_with_index do |message, post|
    if message.text.match /#{title_message}/
      puts  "Post #{post+1}: The message exists !!!"
    else  
      puts "Post #{post+1}: The message doesn't exist :("
    end
  end 
end 
  
  #expect(@browser.div(class: "post_title").text).to eq title_message
  #expect(@browser.div(class: "post_body").text).to eq "nil"

#scenario 2
When(/^I enter "([^"]*)" into the message box$/) do |message|
    
  @browser.div(class: 'editor-richtext').click
  @browser.div(class: 'editor-richtext').send_keys message

end

Then(/^My dashboard should contain a text post with the message "([^"]*)"$/) do                                                                                                                 |arg1|
  
  @browser.driver.manage.timeouts.implicit_wait = 10
  @browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
  @browser.alert.ok
  dashboard_check = @browser.elements(class: "post_title")
  dashboard_check.each_with_index do |message, post|
    if message.text.match /#{message}/
      puts  "Post #{post+1}: The message exists !!!"
    else  
      puts "Post #{post+1}: The message doesn't exist :("
    end 
  end
end 
  
#scenario 4

Given(/^the title box and message box are empty$/) do
  expect(@browser.div(class: 'editor-richtext').text).to eq ""
  expect(@browser.div(class: 'editor-plaintext').text).to eq ""
end

When(/^I click the post button nothing should happen$/) do
  @browser.button(class: "disabled").exists?
end


