require 'spec_helper'

describe Comment do
  it "has the correct attributes" do
    comment = Comment.new
    expect(comment).to respond_to(:author)
    expect(comment).to respond_to(:body)
  end

  it "recognizes its parent post" do
    post = FactoryGirl.create(:post)
    comment = post.comments.create(author: "Henk", body: "Example body")
    nested_comment = comment.comments.create(author: "Jan", body: "Nested comment.")
    expect(comment.post).to eq post
    expect(nested_comment.post).to eq post
  end

end
