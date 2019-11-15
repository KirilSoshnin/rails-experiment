module SetSource
  extend ActiveSupport::Concern

  included { before_filter :set_source }

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
