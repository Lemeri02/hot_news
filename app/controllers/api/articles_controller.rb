class Api::ArticlesController < BaseController
  def index
    records = Article.order_by(created_at: :desc).includes(:locations)
    render json: {
      articles: records.map { |record| article_info(record) }
    }
  end

  def show
    render json: article_info(@record) 
  end

  def create
    create_or_update do |attrs|
      Article.new(record_attributes)
    end
  end

  def update
    create_or_update do |attrs|
      @record.attributes = attrs
      @record
    end
  end

  def destroy
    render_result(record, &:destroy)
  end

  private

  def article_info(record)
    locations = record.locations.map { |x| x.attributes.slice('id', 'name') }
    {article: record.attributes, locations: locations}
  end
end
