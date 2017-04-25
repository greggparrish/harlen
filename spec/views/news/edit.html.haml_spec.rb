require 'rails_helper'

RSpec.describe "news/edit", type: :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :edit => "MyString",
      :destroy => "MyString",
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do

      assert_select "input#news_new[name=?]", "news[new]"

      assert_select "input#news_create[name=?]", "news[create]"

      assert_select "input#news_update[name=?]", "news[update]"

      assert_select "input#news_edit[name=?]", "news[edit]"

      assert_select "input#news_destroy[name=?]", "news[destroy]"

      assert_select "input#news_index[name=?]", "news[index]"

      assert_select "input#news_show[name=?]", "news[show]"
    end
  end
end
