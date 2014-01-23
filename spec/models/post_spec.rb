require 'spec_helper'

describe Post do
  it "has the correct attributes" do
    post = Post.new
    expect(post).to respond_to(:title)
    expect(post).to respond_to(:body)
    expect(post).to respond_to(:author)
  end

  it "has an author of 'n/a' if not available" do
    post = Post.new
    expect(post.author).to eq("n/a")
  end

  it "returns author when available" do
    post = Post.new(author: "Geert")
    expect(post.author).to eq("Geert")
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:post)).to be_valid
  end
  
  it "is invalid without title" do
    expect(FactoryGirl.build(:post, title: nil)).to_not be_valid
  end

  it "is invalid without body" do
    expect(FactoryGirl.build(:post, body: nil)).to_not be_valid
  end
end
