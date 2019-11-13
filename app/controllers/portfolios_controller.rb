class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path,
                      notice: 'Your portfolio item was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
