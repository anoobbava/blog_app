# encoding: utf-8

class ArticleMailer < ApplicationMailer

  def comment_on_article(article, comment)
    @author = article.user
    @article = article
    @comment = comment
    mail(to: @author.email, subject: 'commented on your post')
  end
end
