# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :update, :destroy , to: :cud
    user ||= User.new # guest user (not logged in)
    if user.role_id == 1
      can :manage, [Category, Brand, User , Coupon, Store]
      can :read, ActiveAdmin::Page
    elsif user.role_id == 3
      store = Store.find_by user_id: user.id
      can :read , Store do |st|
        st.user_id == user.id
      end
      can :manage , :request
      can [:read, :create, :show_products_by_brand, :show_products_by_category ] , Product
      can :update , Product do |product|
        product.store_id == store.id
      end
    elsif user.role_id == 2
      can :manage, ShoppingCart do |cart|
        cart.user_id == user.id
      end
      can [:add_to_cart, :remove_from_cart], CartProduct
      can [:read, :show_products_by_brand, :show_products_by_category ] ,Product
    else
      can [:read, :show_products_by_brand, :show_products_by_category ], Product
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
