class PostService
  POST_ATTRIBUTES = %w{ id title content }

  def initialize(mail_service)
    @mail_service = mail_service
  end

  def get_all_posts
    Post.all.map &:to_serializable
  end

  def create_post(post_properties)
    post = to_serializable Post.create!(post_properties)
    @mail_service.send_email 'from@example.com', 'to@example.com',
      'A new post is created', post.content
    post
  end

  private
  def to_serializable(post_model)
    post_model.serializable_hash.slice *POST_ATTRIBUTES
  end
end
