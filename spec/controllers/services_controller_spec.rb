require 'spec_helper'
 
RSpec.describe ServicesController, :type => :controller do
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
     		 Service.new
  		end
 	end

 	describe "POST #create" do
	    context "with valid attributes" do
	      it "saves the new service in the database"
	      it "redirects to the current_user page"
	    end
    
	    context "with invalid attributes" do
	      it "does not save the new service in the database"
	      it "re-renders the :new template"
	    end
  	end

 	
 end
 