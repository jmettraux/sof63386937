
I am the author of most of what you consider "verbiage". I will add to this mountain of verbiage by answering to your question.

In fact, I double checked by creating a simpler version of your project. It's at

  https://github.com/jmettraux/sof63386937

What you are encountering is not a rufus-scheduler issue. It's simply you misunderstanding Rake.

The way to make Rake cooperate:

```ruby
scheduler.every '2m' do
# scheduler.cron('0 08 * * 6') do
  begin
    Rake::Task['load_organizations'].invoke
    Rake::Task['load_organizations'].reenable # <------------ ADD THIS
  rescue Exception => e
    Rails.logger.error 'ERROR in load_organizations'
    Rails.logger.error e.inspect
    Rails.logger.error e.backtrace
  end
end
```

Reading this could help:

  https://til.hashrocket.com/posts/4897ed42b7-invoking-rake-tasks-multiple-times

Enjoy.

