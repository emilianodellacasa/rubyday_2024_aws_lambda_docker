FROM public.ecr.aws/lambda/ruby:3.3

COPY Gemfile Gemfile.lock ${LAMBDA_TASK_ROOT}/

RUN gem install bundler:2.4.11 && \
   bundle config set --local path "vendor/bundle" && \
   bundle install

COPY lambda_function.rb ${LAMBDA_TASK_ROOT}

CMD [ "lambda_function.lambda_handler" ]