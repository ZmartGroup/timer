#encoding: utf-8
class WebhooksController < ApplicationController

  skip_before_filter :require_login


  def index
    render text: "Webhooks are active!"
  end

  
  
end