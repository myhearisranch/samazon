class ReviewsController < ApplicationController

  def create
    product = Product.find(params[:product_id])

    #review_new:

    # productモデルで↓のように定義した。
    # def reviews_new
    #   review.new
    # end

     review = product.reviews_new

    # save_review:
    # Reviewモデルに↓のように定義した。

    # def save_review(review , review_params)
    #   review.content = review_params[:content]
    #   review.user_id = review_params[:user_id]
    #   review.product_id = review_params[:product_id]
    #   save
    # end

    review.save_review(review, review_params)
    redirect_to product_url(product)
  end

  private

    def review_params
      params.require(:review).permit(:content)
        merge(user_id: current_user.id, product_id: params[:product_id])
    end
end
