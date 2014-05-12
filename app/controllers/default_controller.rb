class DefaultController < ApplicationController
  def index

    #@user1 = User.find(1)
    ## add company association if not exists
    #if(@user1.company.nil?)
    #  @user1.build_company({:name => "Acme Co."})
    #  @user1.save
    #end

    @companies = Company.all()
  end
end
