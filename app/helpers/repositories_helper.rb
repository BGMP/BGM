module RepositoriesHelper

  def web_repo_or_first
    r = Repository.where(:repo => ORG::GIT_REPO).first
    return r if r&.open?

    Repository.all.first
  end
end
