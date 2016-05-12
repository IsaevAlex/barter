require 'spec_helper'
 
RSpec.describe UsersController, :type => :controller do
	describe "GET 'index'" do
 		it "returns http success" do
 			get 'index'
 			response.should be_success
 		end

 		it "renders the index template" do
		    get :index
		    expect(response).to render_template("index")
    	end

    	it 'should exists' do
     		 User.new
  		end
 	end

 	
 end
 