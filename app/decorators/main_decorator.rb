class MainDecorator < Draper::Decorator

  def to_cloudfront(url)
    url.to_s.sub(Rails.configuration.s3_bucket_url, Rails.configuration.cloudfront_host)
  end
end
