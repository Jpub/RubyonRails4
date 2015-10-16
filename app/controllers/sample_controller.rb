class SampleController < ApplicationController
  include FormAuth
  def index
    render text: 'Hello World..!'
  end
end
