class PortfoliosController < ApplicationController
before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_items = Portfolio.all
  end

 def new
    @portfolio_item = Portfolio.new
 end

 def show
 end

 def create
   @portfolio_item = Portfolio.new(portfolio_params)

   respond_to do |format|
     if @portfolio_item.save
       format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
     else
       format.html { render :new }
     end
   end
 end

 def edit
  @portfolio_item = Portfolio.find(params[:id])
 end

 def update
   respond_to do |format|
     if @portfolio_item.update(portfolio_params)
       format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

   private

    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

     def portfolio_params
       params.require(:portfolio).permit(:title, :sub_title, :body)
     end

end
