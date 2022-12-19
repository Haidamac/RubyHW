require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/articles/{article_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'

    get('list comments') do
      tags 'Comment'
      response(200, 'successful') do
        let(:article_id) { '123' }
        consumes 'application/json'
        parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
          description: 'Get comments with status: published/unpublished'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create comment') do
      tags 'Comment'
      response(200, 'successful') do
        let(:article_id) { '123' }
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            author_id: { type: :integer }
          },
          required: %w[body author_id]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{article_id}/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show comment') do
      tags 'Comment'
      response(200, 'successful') do
        let(:article_id) { '123' }
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update comment') do
      response(200, 'successful') do
        tags 'Comment'
        let(:article_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            author_id: { type: :integer },
            status: { type: :string, enum: %w[unpublished published] }
          },
          required: false
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update comment') do
      tags 'Comment'
      response(200, 'successful') do
        let(:article_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            author_id: { type: :integer },
            status: { type: :string, enum: %w[unpublished published] }
          },
          required: false
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete comment') do
      tags 'Comment'
      response(200, 'successful') do
        let(:article_id) { '123' }
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
