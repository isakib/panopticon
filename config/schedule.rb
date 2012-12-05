set :job_template, "/usr/local/bin/govuk_setenv panopticon /bin/bash -l -c ':job'"
set :output, {:error => 'log/cron.error.log', :standard => 'log/cron.log'}
job_type :run_script,  'cd :path && RAILS_ENV=:environment script/:task'
