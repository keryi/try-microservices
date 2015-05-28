class PostService
  POST_ATTRIBUTES = %w(id title content)

  def initialize
  end

  def get_all_posts
    PostService::Post.all.map &method(:to_serializable)
  end

  private

  def to_serializable(post_model)
    post_model.serializable_hash.slice *POST_ATTRIBUTES
  end
end
