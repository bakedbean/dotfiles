require 'rubygems'
require 'irb/completion'

def require_without_bundler(gem, file)
  return require(file) unless defined?(::Bundler)
  if gem_path = Dir.glob("{#{Gem.path.join(',')}}/gems/#{gem}*").first
    $LOAD_PATH << "#{gem_path}/lib"
    require file
  else
    raise LoadError, "Gem #{gem} not found via require_without_bundler"
  end
end

begin
  # nice history and color
  require_without_bundler 'blackwinter-wirble', 'wirble' # blackwinter branch has history_uniq fixes
  Wirble::History::DEFAULTS[:history_uniq] = 'reverse'

  Wirble.init
  Wirble.colorize
rescue LoadError
  # No wirble use defaults to get at least history
  require 'irb/ext/save-history'
  IRB.conf[:USE_READLINE] = true
  IRB.conf[:SAVE_HISTORY] = 10000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
end

if ENV['RAILS_ENV']
  require 'hirb'
  Hirb.enable
end

def last_cci_user(visit = false)
  p = Patient.asc(:id).last

  p.visits.first if visit
end

def reset_triggered_visit(paused)
  p = Patient.asc(:id).last
  v = p.visits.first
  v.finish = nil
  v.paused = paused unless !paused

  i = v.assessments.count
  while i > 2
    v.assessments.last.delete
    i -= 1
  end

  v.assessments.last.finish = nil
  v.assessments.last.scores = {}
  v.save
end
