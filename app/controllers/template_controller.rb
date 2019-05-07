class TemplateController < ApplicationController
  def index
    @product = Product.first()
  end
end
