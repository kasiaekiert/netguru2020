require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :author => "MyString",
      :body => "MyText",
      :movie_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[author]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[movie_id]"
    end
  end
end
