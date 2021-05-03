class PagesController < ApplicationController
  def home
  	@services = Service.all
  	@company_information = CompanyInformation.first
  	@destinations = Destination.all
  	@tours = Tour.all
  	@packages = Package.all
  	@testimonials = Contact.where(comment_type: "Testimonial").limit(4)
    @posts = Post.all
  end

  def create
    @contact = Contact.create(user_comment_params)
    if @contact.save

      flash[:notice] = 'your comment is submitted. thank you!!'
      redirect_to root_path
    else
      render :new
    end
  end

  def about
  end

  def contact
    @company_information = CompanyInformation.first
    @testimonials = Contact.where(comment_type: "Testimonial").limit(4)
  end

  def user_comment_params
    params.require(:contact).permit(:full_name,:email,:phone_number,:comment_type,:subject,:message)
  end
end
