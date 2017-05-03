class StaticController < ApplicationController
  def home
    authorize :static, :home?
  end

  def creation
    authorize :static, :creation?
  end

  def philanthropy
    authorize :static, :philanthropy?
  end

  def brand
    authorize :static, :brand?
  end

  def faq
    authorize :static, :faq?
  end

  def contact
    authorize :static, :contact?
  end

  def mailing_list
    authorize :static, :mailing_list?
  end

  def legal
    authorize :static, :legal?
  end

  def terms
    authorize :static, :terms?
  end

end
