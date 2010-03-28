class Admin::SubdomainsController < ApplicationController
  before_filter :get_site
  
  # GET /subdomains
  # GET /subdomains.xml
  def index
    @subdomains = @site.subdomains.find(:all, :order => "views_all_time DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subdomains }
    end
  end

  # GET /subdomains/1
  # GET /subdomains/1.xml
  def show
    @subdomain = @site.subdomains.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subdomain }
    end
  end

  # GET /subdomains/new
  # GET /subdomains/new.xml
  def new
    @subdomain = @site.subdomains.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subdomain }
    end
  end

  # GET /subdomains/1/edit
  def edit
    @subdomain = @site.subdomains.find(params[:id])
  end

  # POST /subdomains
  # POST /subdomains.xml
  def create
    @subdomain = @site.subdomains.new(params[:subdomain])

    respond_to do |format|
      if @subdomain.save
        flash[:notice] = 'Subdomain was successfully created.'
        format.html { redirect_to([:admin, @site, @subdomain]) }
        format.xml  { render :xml => @subdomain, :status => :created, :location => @subdomain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subdomain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subdomains/1
  # PUT /subdomains/1.xml
  def update
    @subdomain = @site.subdomains.find(params[:id])

    respond_to do |format|
      if @subdomain.update_attributes(params[:subdomain])
        flash[:notice] = 'Subdomain was successfully updated.'
        format.html { redirect_to([:admin, @site, @subdomain]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subdomain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subdomains/1
  # DELETE /subdomains/1.xml
  def destroy
    @subdomain = @site.subdomains.find(params[:id])
    @subdomain.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sites_subdomains_url(@site)) }
      format.xml  { head :ok }
    end
  end
end
