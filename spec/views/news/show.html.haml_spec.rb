require 'rails_helper'

RSpec.describe "news/show", type: :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :new => "New",
      :create => "Create",
      :update => "Update",
      :edit => "Edit",
      :destroy => "Destroy",
      :index => "Index",
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Create/)
    expect(rendered).to match(/Update/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Destroy/)
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Show/)
  end
end
