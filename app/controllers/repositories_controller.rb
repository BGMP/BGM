class RepositoriesController < ApplicationController

  def index
    @repositories = Repository.all
  end

  def show
    @repositories = Repository.page(params[:page]).per(20)
    @repository = Repository.friendly.find(params[:slug])
    @revs = []

    if @repository.open?
      Github.repos.commits.list(@repository.namespace, @repository.repo, @repository.branch, :per_page => 100).each do |r|
        author_name = r.commit.committer.name
        author_email = r.commit.committer.email
        message = r.commit.message
        date = r.commit.committer.date
        sha = r.sha

        @revs.push(Revision.new(@repository.provider, author_name, author_email, message, date, sha))
      end
    end

    @revs = Kaminari.paginate_array(@revs).page(params[:page]).per(20)
    @count = (@revs.current_page - 1) * (@revs.limit_value + 1)
  end

  helper do
    def commit_url(sha)
    "https://#{@repository.provider}.com/#{@repository.namespace}/#{@repository.repo}/commit/#{sha}"
    end
  end

  helper do
    def provider_user_url(username)
      "https://#{@repository.provider}.com/#{username}"
    end
  end

  class Revision
    attr_reader :author_name, :author_email, :message, :date, :sha
    attr_writer :deployed, :latest, :author

    def initialize(provider, author_name, author_email, message, date, sha)
      @provider = provider
      @author_name = author_name
      @author_email = author_email
      @message = message
      @date = date
      @sha = sha
    end

    def sha_brief
      sha[0..6]
    end
  end
end
