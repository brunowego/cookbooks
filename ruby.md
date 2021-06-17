# Ruby

<!--
Mechanize
Nokogiri

https://code.tutsplus.com/articles/building-your-first-web-scraper-01--cms-27559
https://www.inkoop.io/blog/web-scraping-using-selenium-ruby/
https://www.scrapingdog.com/blog/web-scraping-with-ruby
https://scraperbox.com/blog/web-scraping-with-ruby?utm_campaign=News&utm_medium=Community&utm_source=DataCamp.com
https://learn.co/lessons/ruby-remote-data-practice-scraping
http://merowing.info/2015/01/extracting-data-from-websites-without-api/
http://tutorials.jumpstartlab.com/topics/scraping-with-capybara.html
http://www.mattmorgante.com/technology/webscraper
https://ronanlopes.me/web-crawler-minerando-noticias-em-ruby-com-o-nokogiri/
https://agilie.com/en/blog/case-study-how-we-built-web-scraper-on-ruby-on-rails
https://www.freecodecamp.org/news/how-to-scrape-with-ruby-and-nokogiri-and-map-the-data-bd9febb5e18a/
https://www.botreetechnologies.com/blog/how-to-do-web-scraping-of-a-static-or-dynamic-website-with-ruby-on-rails/
https://scraperbox.com/blog/web-scraping-with-ruby
https://zenscrape.com/web-scraping-ruby/
https://dev.to/amsmo/web-scraping-in-ruby-great-practice-for-aspiring-web-developers-2k5a
https://dev.to/debosthefirst/how-to-build-a-web-scraper-in-ruby-a-covid-19-live-data-example-16o0
https://hackernoon.com/my-journey-building-a-scraper-with-ruby-vx1n3y05
https://itnext.io/building-a-basic-scraper-with-ruby-1cec071ada83
https://rapidapi.com/blog/web-scraping-ruby/
https://sloboda-studio.com/blog/how-to-do-web-scraping-with-ruby/
https://www.scrapingbee.com/blog/web-scraping-ruby/
https://onebitcode.com/web-scraping-com-ruby/
https://medium.com/@jennyjean8675309/web-scraping-with-ruby-and-nokogiri-73e75a6f34ed

https://rubyinstaller.org/
-->

<!--
https://linkedin.com/learning/ruby-essential-training-part-1-the-basics/learn-the-basics-of-ruby
https://app.pluralsight.com/paths/skill/ruby-language-fundamentals

https://app.pluralsight.com/paths/skill/ruby-language-fundamentals
https://linkedin.com/learning/topics/ruby?entityType=COURSE
https://app.pluralsight.com/library/courses/ruby-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/reading-writing-data-ruby/table-of-contents
-->

## References

- [Web Content Scrapers](https://www.ruby-toolbox.com/categories/Web_Content_Scrapers)

## Testing

- Runit

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ruby \
  --name ruby \
  docker.io/library/ruby:2.7.0
```

## CLI

### Installation

#### Homebrew

```sh
brew install ruby
```

### Usage

```sh
# Version
ruby --version | head -1
```

### Tips

#### Visual Studio Code

```sh
code --install-extension misogi.ruby-rubocop
```

### Issues

#### Permission denied

```log
ERROR:  While executing gem ... (Errno::EACCES)
    Permission denied @ rb_sysopen - /Library/Ruby/Site/2.6.0/rubygems.rb
```

```sh
# Darwin
sudo chown -R "$USER":wheel /Library/Ruby/Site
```

<!-- #### Could not find a valid gem

```log
ERROR: Could not find a valid gem 'rake' (>= 0), here is why: windows
```

```sh
gem sources
gem sources -a http://rubygems.org/
gem sources --remove https://rubygems.org/
gem install rake
``` -->

<!-- #### Certificate verify failed

```log
SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
```

```sh
https://gist.github.com/luislavena/f064211759ee0f806c88
``` -->

#### Failed to build gem native extension

```log
ERROR: Failed to build gem native extension.
```

```sh
gem update --system
```

<!-- #### Psych:Module

```log
private method load called for Psych:Module
```

```sh
gem update --system
``` -->

<!-- #### Token

```log
NoMethodError (undefined method `[]' for nil:NilClass):
```

Need add `{}` or `nil`. -->

<!-- #### Nginx

```log
413 Request Entity Too Large
```

```sh
sudo vim /etc/nginx/sites-available/[appname]

server {
    client_max_body_size 8M;
}
```

```sh
sudo systemctl restart nginx
``` -->

<!-- #### MiniMagick::Error

##### APT

```log
MiniMagick::Error (ImageMagick/GraphicsMagick is not installed):
```

```sh
sudo apt update
sudo apt -y install imagemagick
``` -->
