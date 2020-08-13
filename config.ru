
# config.ru

require 'json'

require_relative 'scheduler'


app = proc do |env|

  [ 200, { 'Content-Type' => 'text/json' }, [ JSON.pretty_generate(env) ] ]
end

run app

