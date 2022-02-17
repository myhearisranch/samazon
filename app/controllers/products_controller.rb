class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]

  def index

      #product.rbで、display_listというメソッドを定義した。
      # scope :display_list, -> (category, page) {
      #     if category != "none"
      #       where(category_id: category).page(page).per(PER)
      #     else
      #       page(page).per(PER)
      #     end
      #   }

      @products = Product.display_list(category_params, params[:page])

      #Categoryモデルに定義した
      #category_paramsによって、送られたcategoryの値で識別

      # scope :request_category, -> (category) {
      #   if category != "none"
      #     find(category.to_i)
      #   else
      #     ""
      #   end
      # }

      @category = Category.request_category(category_params)
      @categories = Category.all

      #major_categoriesメソッドは、Categoryモデルに↓のように定義した。
      #scope :major_categories, -> { pluck(:major_category_name).uniq }
      #すべてのカテゴリのデータの中からmajor_category_nameのカラムのみを取得しています。そしてさらにuniqメソッドを使い、重複するデータを削除しています。

      @major_category_names = Category.major_categories
    end
  end

  def show

    @reviews = @product.reviews
    @review = @reviews.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_url @product
  end

  def edit
    @categories = Category.all
  end

  def update
    @product.update(product_params)
    redirect_to product_url @product
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  def favorite

    #user.toggle_like:
    #商品に対する「いいね」の状態を現在の状態から逆にする。

    current_user.toggle_like!(@product)
    redirect_to product_url @product

  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end


    #<%= link_to category.name, products_path(category: category.id) %>で、
    #category=>category.idを送る。
    #それを、category_paramsで識別

    def category_params
      params[:category].present? ? params[:category]
                                  : "none"
    end

end
