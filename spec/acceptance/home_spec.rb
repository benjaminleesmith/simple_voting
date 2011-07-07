require 'spec_helper'
 
describe 'home page' do
  it 'should show list of votable topics' do
    Factory.create(:topic, title: 'controller testing')
    Factory.create(:topic, title: 'model testing')
    Factory.create(:topic, title: 'javascript testing')
    Factory.create(:topic, title: 'acceptance testing')
    Factory.create(:topic, title: 'coffeescript')
    Factory.create(:topic, title: 'sass')
    visit '/'
    page.should have_content('controller testing')
    page.should have_content('model testing')
    page.should have_content('javascript testing')
    page.should have_content('acceptance testing')
    page.should have_content('coffeescript')
    page.should have_content('sass')
  end
  
  it 'should allow voting on topics' do
    Factory.create(:topic, title: 'controller testing')
    visit '/'
    click_link 'Vote!'
    current_path.should == '/'
    page.should have_content '1 Vote'
    click_link 'Vote!'
    page.should have_content '2 Votes'
  end
end