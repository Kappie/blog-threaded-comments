require 'spec_helper'

describe PostsController do
  describe "GET #index" do
    it "fetches all posts when tag parameter not present" do
      post1, post2 = FactoryGirl.create(:post), FactoryGirl.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post1, post2])
    end

    it "fetches only posts with tag if tag parameter present" do
      post1, post2 = FactoryGirl.create(:post), FactoryGirl.create(:post)
      tag = Tag.create(name: "reading")
      post1.tags = [tag]

      get :index, :tag => tag.id
      expect(assigns(:posts)).to eq([post1])
    end
  end
end
