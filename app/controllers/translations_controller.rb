class TranslationsController < ApplicationController
  def create
    redirect_to root_path
    puts "!!!! #{params["sentence"]}"
  end
end
