require 'spec_helper'
 
RSpec.describe OrdersController, :type => :controller do
	describe "GET 'index'" do
 		it 'should exists' do
     		 Order.new
  		end
 	end

 	describe "GET #new" do
    	it "assigns a new order to @order"
    	it "renders the :new template"
  	end

  	describe "GET #show" do
    	it "assigns the requested order to @order"
    	it "renders the :show template"
  	end

 	describe "POST #create" do
	    context "with valid attributes" do
	      it "saves the new order in the database"
	      it "redirects to the current_user page"
	    end
    
	    context "with invalid attributes" do
	      it "does not save the new order in the database"
	      it "re-renders the :new template"
	    end
	 end

 	
 end
 