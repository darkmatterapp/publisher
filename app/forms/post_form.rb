class PostForm
  include ActiveModel::Model
  POST_COLUMNS = [:title,
                  :subtitle,
                  :content,
                  :slug,
                  :in_reply_to,
                  :private,
                  :published_at,
                  :tags].freeze
  attr_accessor :klass,
                :post,
                :post_type

  delegate      :title,
                :subtitle,
                :content,
                :slug,
                :in_reply_to,
                :private,
                :published_at,
                :post_type_id,
                :post_type_type,
                :tags,
                :path,
                to: :post,
                allow_nil: true

  def initialize(klass, post = nil)
    @klass     = klass
    @columns   = klass.columns.map(&:name)
    @post      = post || Post.new
    @post_type = self.post.post_type || klass.new
    define_attr_accessor(@columns)
    @columns.each do |col|
      send("#{col}=", @post_type.send(col))
    end
  end

  def model_name
    ActiveModel::Name.new(self, nil, @klass.to_s)
  end

  def persisted?
    @post.persisted?
  end

  def submit(params)
    params.delete(:slug) if params[:slug].blank?
    @post_type = @klass.new(params.permit(@columns))
    @post      = @post_type.build_post(params.permit(self.class::POST_COLUMNS))
    @post_type.save
  end

  def update(params)
    post.attributes           = params.permit(self.class::POST_COLUMNS)
    post.post_type.attributes = params.permit(@columns)
    post.save! && post.post_type.save! if post.valid? && post.post_type.valid?
  end

  private

  def define_attr_accessor(columns)
    self.class.class_eval do
      columns.each do |col|
        attr_accessor col.to_sym
      end
    end
  end
end
