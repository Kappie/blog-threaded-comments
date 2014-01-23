module PostsHelper
  def show_tags
    raw @post.tags.map { |tag| link_to tag.name, tag_path(tag) }.join(", ")
  end

  def all_tags
    raw @tags.map { |tag| raw link_to tag.name, tag_path(tag) }.join(", ")
  end
end
