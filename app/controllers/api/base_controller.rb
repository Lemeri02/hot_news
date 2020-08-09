class Api::BaseController < ApplicationController
  before_action :require_login, only: [:create, :update, :destroy]
  before_action :find_record, only: [:show, :update, :destroy]

  protected

  def find_record
    klass = self.class.name.match(/^Api::(.+)Controller$/)[1].singularize.constantize
    @record = klass.find_by(id: params[:id])
  end

  def create_or_update
    record_attributes = params.require(:article)
    record = yield(record_attributes)
    render_result(record, &:save)
    # if record.save
    #   render json: {success: true}
    # else
    #   render json: {error: record.errors}, status: 422
    # end
  end

  def render_result(record)
    if yield(record)
      render json: {success: true}
    else
      render json: {error: record.errors}, status: 422
    end
  end
end
