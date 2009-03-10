require 'digest/md5'

class UsersController < ApplicationController

  def login
    respond_to do |format|
      format.amf {
        if User.find(:first, :conditions => ["email=? and password=?",params[0],Digest::MD5.hexdigest(params[1])])
          render :amf => @user
        else
          render :amf => FaultObject.new("authentication failure")
        end
      }
    end
  end

  def create
    begin

      raise Exception.new("wrong parameters") if !(params[:login] && params[:password])

      @user = User.register(params[:login], params[:password])

      render :amf => @user

    rescue Exception => ex
      logger.error "ERROR: error creating user #{ex.message}"
      logger.error ex.backtrace.join("\n")
      render :amf => FaultObject.new(ex.message || "Error registering user")
    end
  end

end
