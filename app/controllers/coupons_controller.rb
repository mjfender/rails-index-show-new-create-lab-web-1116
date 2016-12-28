class CouponsController < ApplicationController 
  # get "student/:id/activate", to: "students#activate", as: :activate_student
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
  end

  def create
    if !params[:coupon].nil?
      @coupon = Coupon.create(coupon_code: params[:coupon][:coupon_code], store: params[:coupon][:store])
      redirect_to coupon_path(@coupon)
    else 
      @coupon = Coupon.create(coupon_code: params[:coupon_code], store: params[:store])
      redirect_to coupon_path(@coupon)
    end
  end

end