class Admin::StaticFilesController < ApplicationController
  # GET /static_files
  # GET /static_files.xml
  def index
    @static_files = StaticFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @static_files }
    end
  end

  # GET /static_files/1
  # GET /static_files/1.xml
  def show
    @static_file = StaticFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @static_file }
    end
  end

  # GET /static_files/new
  # GET /static_files/new.xml
  def new
    @static_file = StaticFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @static_file }
    end
  end

  # GET /static_files/1/edit
  def edit
    @static_file = StaticFile.find(params[:id])
  end

  # POST /static_files
  # POST /static_files.xml
  def create
    @static_file = StaticFile.new(params[:static_file])

    respond_to do |format|
      if @static_file.save
        flash[:notice] = 'StaticFile was successfully created.'
        format.html { redirect_to([:admin, @static_file]) }
        format.xml  { render :xml => @static_file, :status => :created, :location => @static_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @static_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /static_files/1
  # PUT /static_files/1.xml
  def update
    @static_file = StaticFile.find(params[:id])

    respond_to do |format|
      if @static_file.update_attributes(params[:static_file])
        flash[:notice] = 'StaticFile was successfully updated.'
        format.html { redirect_to([:admin, @static_file]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @static_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /static_files/1
  # DELETE /static_files/1.xml
  def destroy
    @static_file = StaticFile.find(params[:id])
    @static_file.destroy

    respond_to do |format|
      format.html { redirect_to(admin_static_files_url) }
      format.xml  { head :ok }
    end
  end
end
