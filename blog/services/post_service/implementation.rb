class PostService
  POST_ATTRIBUTES = %w(id title content)

  def initialize
  end

  def get_all_posts
    PostService::Post.all.map &method(:to_serializable)
  end

  def create_post(post_properties)
    to_serializable PostService::Post.create!(post_properties)
  end

  def get_post_by_id(id)
    to_serializable PostService::Post.find id
  end

  def get_comments_by_post_id(id)
    PostService::Comment.where(post_id: id).map do |comment_model|
      attrs = comment_model.attributes
      attrs.update(attrs) do |k, v|
        v.is_a?(ActiveSupport::TimeWithZone) ? v.to_s : v
      end
    end
  end

  private

  def to_serializable(post_model)
    post_model.serializable_hash.slice *POST_ATTRIBUTES
  end
end
