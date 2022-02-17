class Category < ApplicationRecord
  has_many :products

  #pluck(:major_category_name).uniqの部分では、すべてのカテゴリのデータの中からmajor_category_nameのカラムのみを取得しています。そしてさらにuniqメソッドを使い、重複するデータを削除しています。
  scope :major_categories, -> {pluck(:major_category_name).uniq}

  scope :request_category, -> (category) {
    if category != "none"
      find(category.to_i)
    else
      ""
    end
  }

end
