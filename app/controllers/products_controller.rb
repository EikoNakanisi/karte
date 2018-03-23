class ProductsController < ApplicationController
  def index
    # N+1問題のため、allではなくincludes
    @products = Product.order(:name)

    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls { send_data @products.to_csv(col_sep: "\t") }
    end
  end

def import
  # fileはtmpに自動で一時保存される
  Product.import(params[:file])
  redirect_to products_url, notice: "商品を追加しました。"
end





end
