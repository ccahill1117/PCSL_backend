class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
      if @quote.update!(quote_params)
        render status: 200, json: {
          message: "your quote has been updated!"
        }
    end
    @quote.update(quote_params)
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  # private
  # def json_response(object, status = :ok)
  #   render json: object, status: status
  # end

  def quote_params
    params.permit(:id, :author, :content)
  end
end


#  curl —-data ‘{“id”:23, ”content”: “hi”, ”author”: “ok”}’ -X POST localhost:3000/quotes
# curl --data '{"id": 24, "content": "test2", "author": "person"}' -X POST localhost:3000/quotes
