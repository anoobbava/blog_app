# encoding: utf-8

class ArticleMailer < ApplicationMailer
  def update_article(article)
    @link = article.links.last
    @author = article.user
    @article_title = article.title
    mail(to: @author.email, subject: 'Citation Added')
  end

  def comment_on_article(article, comment)
    @author = article.user
    @article = article
    @comment = comment
    mail(to: @author.email, subject: 'commented on your post')
  end
end
