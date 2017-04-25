require 'rails_helper'

RSpec.describe "news/index", type: :view do
  before(:each) do
    assign(:news, [
      News.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :edit => "Edit",
        :destroy => "Destroy",
        :index => "Index",
        :show => "Show"
      ),
      News.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :edit => "Edit",
        :destroy => "Destroy",
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of news" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Edit".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
