#Hooks
#Set up Browser

browser = Watir::Browser.new :firefox

#Before each
Before do
@browser = browser
@browser.cookies.clear
end

#After each @post scenario
After ("@wip") do |scenario|
 
  #delete post
  @browser.goto "http://www.tumblr.com/blog/deepesthologramtyphoon"
  @browser.div(class: "post_control").click
  @browser.div(class: "post_control delete").click
  @browser.button(class: "chrome blue").click  
  
end

After do |scenario|

  #raise "woops" if scenario.failed?

end 

at_exit do
  #Teardown
  browser.close
end