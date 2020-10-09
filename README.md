# Raes

Raes is Rails Async Event Store. Executes a class method call asynchronously.
Others use Rails' [Active Job](https://edgeguides.rubyonrails.org/active_job_basics.html) and [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html) services to store files.

- Raes (※)

![rice](https://4.bp.blogspot.com/-q86BWyQStFw/WWNAvW36HNI/AAAAAAABFWc/hzm92utRk6AJzd0z2sRYc_WYJ-n3jQKNQCLcBGAs/s100/kome_hakumai.png)

## Usage

Dispatch a class name that has a call method.

### Simple Echo

Same echo call method.

```ruby
class SimpleEcho
  include Raes::UseCaller

  def initialize(params)
    @params = params
  end

  def call
    @params
  end
end
```

When executed, `{ message:'Hi' }` is saved in state.

```ruby
Raes.dispatch(SimpleEcho, { message: 'Hi' })
Raes.search(SimpleEcho).last.state # "{\"message\":\"Hi\"}"
```

### File Maker

Rewrite old file newly.

```ruby
class FileMaker
  include Raes::UseCaller
  include Raes::UseStorage

  def initialize(params)
    @raes_storage_id = params[:raes_storage_id]
  end

  def call
    old_file = raes_storage_content
    new_file = old_file + 'bar'

    raes_storage_attach({ io: StringIO.new(new_file), filename: 'new_file.txt', content_type: 'text/plain' })
  end
end
```

Content will be changed to the new file.

```ruby
Raes.dispatch(FileMaker, raes_storage: { io: StringIO.new('foo'), filename: 'old_file.txt', content_type: 'text/plain' })
Raes.search(FileMaker).last.storages.first.content.download # foobar
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raes'
```

And then execute:

```bash
$ bundle
$ rails raes:install:migrations
```

If use storage, then execute:

```bash
$ rails active_storage:install
```

## Configuration

Add the following to your config/raes.yml:

```yaml
default: &default
  concern:
    context_logger: Rails

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

## Test

```bash
$ rails app:spec
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
