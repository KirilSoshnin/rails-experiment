class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit show update destroy]
  layout 'portfolio'
  access all: %i[show index angular], user: { except: %i[destroy new create update edit] }, site_admin: :all

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

  def edit; end

  # rubocop:disable Metrics/MethodLength
  def update
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

  def show; end

  def destroy
    @portfolio_item.destroys
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

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
