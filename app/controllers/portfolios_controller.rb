class PortfoliosController < ApplicationController
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @portfolio_items = Portfolio.angular
  end

  def ruby_on_rails
    @portfolio_items = Portfolio.ruby_on_rails
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
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

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  # rubocop:disable Metrics/MethodLength
  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to portfolios_path,
                      notice: 'The portfolio item was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html do
        redirect_to portfolios_url,
                    notice: 'Portfolio item was successfully removed.'
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      technologies_attributes: %i[name]
    )
  end
end
