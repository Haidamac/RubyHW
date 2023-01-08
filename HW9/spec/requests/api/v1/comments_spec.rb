require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  let(:author) { Author.first }
  let(:article) { Article.first }
  let(:comment) { Comment.first }

  path '/api/v1/articles/{article_id}/comments' do
    # You'll want to customize the parameter types...
    # debugger
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'
    get('list comments') do
      tags 'Comment'
      consumes 'application/json'
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
        description 'Get comments with status: published/unpublished'
      response(200, 'successful') do
        let(:article_id) { Article.first.id }
        it 'Get published/unpublished comments for article' do
          expect(Comment.where(article_id: article_id, status: 'unpublished').ids).to eq(article.comments.unpublished.ids)
        end
        run_test!
      end
    end

    post('create comment') do
      tags 'Comment'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[body author_id]
      }
      response(201, 'successful') do
        let(:comment) { { body: 'Body comment', article_id: article.id, author_id: author.id } }

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
        let(:article_id) { Article.first.id }
        let(:id) { Comment.first.id }
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
      tags 'Comment'
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
      response(200, 'successful') do
        describe 'PATCH api/v1/articles{id}/comments{id}' do
          it 'check patch comment' do
            comment.update(status: 'published')
            expect(Comment.find_by(status: 'published')).to eq(comment)
          end
        end
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
      response(200, 'successful') do
        describe 'PUT api/v1/articles{id}/comments{id}' do
          it 'check put comment' do
            comment.update(body: 'Great job!')
            expect(Comment.find_by(body: 'Great job!')).to eq(comment)
          end
        end
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
      response(200, 'Delete') do
        describe 'DELETE api/v1/articles{id}/comments{id}' do
          it 'delete comment' do
            comment.destroy
            expect(Comment.find_by_id('id')).to eq(nil)
          end
        end
        run_test!
      end
    end
  end
end
