class PagesController < ApplicationController
  def home
    @company_information = CompanyInformation.first
  	@services = Service.all
  	@destinations = Destination.all
  	@tours = Tour.all
  	@packages = Package.all
  	@testimonials = Contact.where(comment_type: "Testimonial").limit(4).order('created_at DESC')
    @posts = Post.limit(4).order('created_at DESC')
    @partners = Partner.all.limit(4)
    @faq = FrequentlyAskedQuestion.limit(6).order('created_at DESC')
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
    @company_information = CompanyInformation.first
    @services = Service.all
    @testimonials = Contact.where(comment_type: "Testimonial").limit(4).order('created_at DESC')
    @partners = Partner.all.limit(4)
    @faq = FrequentlyAskedQuestion.limit(6).order('created_at DESC')
  end

  def contact
    @company_information = CompanyInformation.first
    @testimonials = Contact.where(comment_type: "Testimonial").limit(4).order('created_at DESC')
  end

  def user_comment_params
    params.require(:contact).permit(:full_name,:email,:phone_number,:comment_type,:subject,:message)
  end
end
